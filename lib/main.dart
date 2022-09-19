import 'dart:io';

import 'package:catcher/catcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/page/frame/common_frame1.dart';
import 'package:gload_app/page/Main_screens/home.dart';
import 'package:gload_app/state/auth_state.dart';
import 'package:provider/provider.dart';
import 'constant/theme.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..maxConnectionsPerHost = 5; // Http 통신을 하기 위해 클라이언트 구현
    // 최대 연결 가능한 라이브 수 5개
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();

  final debugOption = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(['kooyh108@naver.com'])
  ]);

  final releaseOption = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(['kooyh108@naver.com']),
  ]);

  Catcher(
      rootWidget: MyApp(),
      debugConfig: debugOption, // debug 모드로 사용시,
      releaseConfig: releaseOption); // release 모드로 사용시,
  // runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthState()),
    ],
    child: MaterialApp(
      //title: _title,
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: CommonFrame1(title: 'GROAD', clas: Home(),),
    ));
    // return MaterialApp(
    //   //title: _title,
    //   debugShowCheckedModeBanner: false,
    //   theme: theme(),
    //   home: CommonFrame1(title: 'GROAD', clas: Home(),),
    // );
  }
}





