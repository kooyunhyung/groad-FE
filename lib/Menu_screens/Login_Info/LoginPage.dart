import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/Main_screens/main_screens.dart';
import 'package:gload_app/Main_screens/theme.dart';
import 'package:gload_app/Menu_screens/Login_Info/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
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
                    primaryColor: Color(deepNavy),
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                      color: Color(deepNavy),
                      fontSize: 15.0,
                    ))),
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: controller,
                        decoration: InputDecoration(labelText: 'Enter "ID"'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        controller: controller2,
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
                                  color: Color(deepNavy),
                                  onPressed: () {
                                    if (controller.text == 'id' &&
                                        controller2.text == '1234') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  MainScreens()));
                                    } else if (controller.text == 'id' &&
                                        controller2.text != '1234') {
                                      showSnackBar2(context);
                                    } else if (controller.text != 'id' &&
                                        controller2.text == '1234') {
                                      showSnackBar3(context);
                                    } else {
                                      showSnackBar(context);
                                    }
                                  },
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 35.0,
                                  ))),
                          SizedBox(
                            width: 20.0,
                          ),
                          ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: RaisedButton(
                                color: Color(deepNavy),
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
    backgroundColor: Color(deepNavy),
  ));
}

void showSnackBar2(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      '비밀번호가 일치하지 않습니다',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Color(deepNavy),
  ));
}

void showSnackBar3(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      'id의 철자를 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Color(deepNavy),
  ));
}
