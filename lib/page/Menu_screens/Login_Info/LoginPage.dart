import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/api/user_api.dart';
import 'package:gload_app/page/frame/common_frame1.dart';
import 'package:gload_app/page/Main_screens/home.dart';
import 'package:gload_app/constant/theme.dart';
import 'package:gload_app/page/Menu_screens/Login_Info/signup.dart';
import 'package:gload_app/page/frame/common_frame2.dart';

import '../../../component/dialog/notify_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController id = TextEditingController();
  TextEditingController pw = TextEditingController();
  dynamic response2;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: height*0.1)),
                Image.asset('assets/image10.png'),
                Form(
                    child: Theme(
                  data: ThemeData(
                      primaryColor: Color(ThemeColors.deepNavy),
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                        color: Color(ThemeColors.deepNavy),
                        fontSize: 15.0,
                      ))),
                  child: Container(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: id,
                          decoration: InputDecoration(labelText: 'Enter "ID"'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextField(
                          controller: pw,
                          decoration:
                              InputDecoration(labelText: 'Enter "Password"'),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonTheme(
                                minWidth: 100.0,
                                height: 50.0,
                                child: RaisedButton(
                                    color: Color(ThemeColors.deepNavy),
                                    onPressed: () async {
                                      final response1 = await UserAPI(
                                              context: context)
                                          .user_login(id: id.text, pw: pw.text);
                                      print(response1);
                                      if (response1["gu_seq"] != -1) {
                                        try {
                                          response2 =
                                              await UserAPI(context: context)
                                                  .getSetting(
                                                      fk: response1["gu_seq"]);
                                        } catch (e) {
                                          print(e);
                                          await UserAPI(context: context)
                                              .createSetting(
                                                  map: 0,
                                                  themeColor: 0,
                                                  onoff1: 0,
                                                  onoff2: 0,
                                                  onoff3: 0,
                                                  fk: response1["gu_seq"]);

                                          final response4 =
                                              await UserAPI(context: context)
                                                  .getSetting(
                                                      fk: response1["gu_seq"]);

                                          final response3 = await UserAPI(
                                                  context: context)
                                              .getUser(pk: response1["gu_seq"]);

                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      CommonFrame1(
                                                        idKey:
                                                            response1["gu_seq"],
                                                        userInfo: response3,
                                                        themeColor: response4[
                                                            'gs_theme'],
                                                        title: "GROAD",
                                                        clas: Home(
                                                            userInfo: response3,
                                                            idKey: response1[
                                                                "gu_seq"],
                                                            mapType: response4[
                                                                'gs_map'],
                                                            themeColor:
                                                                response4[
                                                                    'gs_theme']),
                                                      )),
                                              (route) => false);
                                          return;
                                        }

                                        final response3 = await UserAPI(
                                                context: context)
                                            .getUser(pk: response1["gu_seq"]);
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    CommonFrame1(
                                                      idKey:
                                                          response1["gu_seq"],
                                                      themeColor:
                                                          response2['gs_theme'],
                                                      title: "GROAD",
                                                      clas: Home(
                                                          userInfo: response3,
                                                          idKey: response1[
                                                              "gu_seq"],
                                                          mapType: response2[
                                                              'gs_map'],
                                                          themeColor: response2[
                                                              'gs_theme']),
                                                    )),
                                            (route) => false);
                                      } else {
                                        NotifyDialog.show(context,
                                            style: TextStyle(
                                                fontSize: 50,
                                                color: ThemeColors.black,
                                                height: 23 / 18
                                            ),
                                            message: '로그인 정보를 다시 확인하세요.'
                                        );
                                      }
                                    },
                                    child: Text(
                                      '로그인',
                                      style: TextStyle(color: Colors.white),
                                    ))),
                            SizedBox(
                              width: 20.0,
                            ),
                            ButtonTheme(
                                minWidth: 100.0,
                                height: 50.0,
                                child: RaisedButton(
                                  color: Color(ThemeColors.deepNavy),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CommonFrame2(
                                                    title: '회원가입',
                                                    clas: SignupPage())));
                                  },
                                  child: Text(
                                    '회원가입',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          );
        },
      ),
    );
  }
}

