import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gload_app/constant/theme.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '/component/dialog/error_dialog.dart';
import '/state/auth_state.dart';
import 'page/Main_screens/home.dart';
import 'page/frame/common_frame1.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key key, this.flag}) : super(key: key);

  final bool flag;

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();

    _next();
  }

  Future<bool> checkPermission() async {
    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    Map<Permission, PermissionStatus> status = await [
      if (Platform.isIOS ||
          (Platform.isAndroid && deviceInfo.version.sdkInt <= 30))
        Permission.location,
        Permission.camera,
    ].request();

    bool per = true;

    status.forEach((permission, permissionStatus) async {
      if (permissionStatus.isDenied) {
        per = false;
      }
    });

    if (!per) {
      await Fluttertoast.showToast(
          msg: '카메라 및 위치 사용권한이 거부되었습니다.\nGROAD 이용에 제한이 있을 수 있습니다.');
    }
    return per;
  }

  void _next() async {
    try {
      await checkPermission();
      await context.read<AuthState>().checkFirstLaunch();           // ??

      await Future.wait([
        //context.read<AuthState>().autoLogin(context),
        Future.delayed(Duration(seconds: 3))
      ]);

      // if (context.read<AuthState>().isLogin) {    // 핸드폰 내부 저장소 _storage에
      //   // token 값이 있으면 = true
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => HomePage(title: 'Robot'),
      //     ),
      //   );
      //   return;
      // }

      if (context.read<AuthState>().firstInit) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CommonFrame1(
              title: 'GROAD',
              clas: Home(),
            ),
          ),
        );
        return;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CommonFrame1(
            title: 'GROAD',
            clas: Home(),
          ),
        ),
      );

      // else {
      //   if (Platform.isIOS) {
      //     exit(0);
      //   }
      //   SystemNavigator.pop();
      // }
    } catch (e, s) {
      print(e);
      print(s);
      FlutterSecureStorage _storage = FlutterSecureStorage();
      await _storage.deleteAll();
      await ErrorDialog.show(context, message: '$s');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CommonFrame1(
            title: 'GROAD',
            clas: Home(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(ThemeColors.deepNavy),
        child: Center(
          child: Text(
            'GROAD',
            style: TextStyle(
              color: ThemeColors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ),
    );
  }
}
