import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:gload_app/api/user_api.dart';
import 'package:gload_app/component/dialog/error_dialog.dart';
import 'package:gload_app/component/dialog/notify_dialog.dart';
import 'package:gload_app/models/user.dart';
import 'package:gload_app/page/Menu_screens/Login_Info/LoginPage.dart';

import '../../../constant/theme.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController id = TextEditingController();
  TextEditingController pw = TextEditingController();
  TextEditingController pwCheck = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: id,
                decoration: InputDecoration(
                  labelText: 'ID*',
                  hintText: '예) kooyh108',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: pw,
                decoration: InputDecoration(
                    labelText: 'Password*',
                    hintText: "********",
                    border: OutlineInputBorder()),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: pwCheck,
                decoration: InputDecoration(
                    labelText: 'Confirm password*',
                    hintText: "********",
                    border: OutlineInputBorder()),
                obscureText: true,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'name*',
                  hintText: '예) 홍길동',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: gender,
                decoration: InputDecoration(
                  labelText: 'gender*',
                  hintText: '예) M 또는 F',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: birthDate,
                decoration: InputDecoration(
                  labelText: 'birth date*',
                  hintText: '예) 950423',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    labelText: 'Email*',
                    hintText: "kooth108@gmail.com",
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: phone,
                decoration: InputDecoration(
                  labelText: 'Phone number*',
                  hintText: '예) 01041073965',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  child: Text('Sign up'),
                  onPressed: () async{
                    if(id.text == ""){
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 50,
                              color: ThemeColors.black,
                              height: 23 / 18
                          ),
                          message: 'ID 값을 입력하지 않았습니다.'
                      );
                      return;
                    }
                    if(pw.text == ""){
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 50,
                              color: ThemeColors.black,
                              height: 23 / 18
                          ),
                          message: 'Password 값을 입력하지 않았습니다.'
                      );
                      return;
                    }
                    if(pwCheck.text == ""){
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 50,
                              color: ThemeColors.black,
                              height: 23 / 18
                          ),
                          message: 'Confirm Password 값을 입력하지 않았습니다.'
                      );
                      return;
                    }
                    if(name.text == ""){
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 50,
                              color: ThemeColors.black,
                              height: 23 / 18
                          ),
                          message: 'name 값을 입력하지 않았습니다.'
                      );
                      return;
                    }
                    if(gender.text == ""){
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 50,
                              color: ThemeColors.black,
                              height: 23 / 18
                          ),
                          message: 'gender 값을 입력하지 않았습니다.'
                      );
                      return;
                    }
                    if(!(gender.text == "M" || gender.text =="F")){
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 50,
                              color: ThemeColors.black,
                              height: 23 / 18
                          ),
                          message: 'gender 값을 M 또는 F로 입력하여 주세요.'
                      );
                      return;
                    }
                    if(birthDate.text == ""){
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 50,
                              color: ThemeColors.black,
                              height: 23 / 18
                          ),
                          message: 'birth date 값을 입력하지 않았습니다.'
                      );
                      return;
                    }
                    if(email.text == ""){
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 50,
                              color: ThemeColors.black,
                              height: 23 / 18
                          ),
                          message: 'Email 값을 입력하지 않았습니다.'
                      );
                      return;
                    }
                    if(phone.text == ""){
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 50,
                              color: ThemeColors.black,
                              height: 23 / 18
                          ),
                          message: 'Phone number 값을 입력하지 않았습니다.'
                      );
                      return;
                    }
                    if(pw.text != pwCheck.text){
                      NotifyDialog.show(context,
                        style: TextStyle(
                          fontSize: 50,
                          color: ThemeColors.black,
                          height: 23 / 18
                        ),
                        message: '비밀번호와 재확인이 동일하지 않습니다.'
                      );
                      return;
                    }
                      final response = await UserAPI(context: context).createUser(
                          id: id.text,
                          pw: pw.text,
                          name: name.text,
                          gender: gender.text,
                          birth: birthDate.text,
                          email: email.text,
                          phone: phone.text);
                      print(response);
                      if(response['code'] == 200){
                        Navigator.pop(context);
                      }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
