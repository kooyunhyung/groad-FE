import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/api/user_api.dart';
import 'package:gload_app/page/frame/common_frame1.dart';
import 'package:gload_app/page/Main_screens/home.dart';
import 'package:gload_app/constant/theme.dart';
import 'package:gload_app/page/Menu_screens/Login_Info/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController id = TextEditingController();
  TextEditingController pw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 50.0)),
                Center(
                  child: Image(
                    image: AssetImage('assets/image10.png'),
                    width: 170.0,
                    height: 190.0,
                  ),
                ),
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
                                    onPressed: () async{
                                      final response = await UserAPI(context: context).user_login(id: id.text, pw: pw.text);
                                      print(response);
                                      if (response["gu_seq"] != -1) {
                                        Navigator.pop(context);
                                      } else {
                                        showSnackBar(context);
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
                                                SignupPage()));
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

void showSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      '로그인 정보를 다시 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Color(ThemeColors.deepNavy),
  ));
}

