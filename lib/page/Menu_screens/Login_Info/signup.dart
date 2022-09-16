import 'package:flutter/material.dart';
import 'dart:io';

class SignupPage extends StatelessWidget {
  //const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'First name*',
                        hintText: 'John',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Last name*',
                        hintText: 'Doe',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
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
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Password*',
                    hintText: "********",
                    border: OutlineInputBorder()),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Confirm password*',
                    hintText: "********",
                    border: OutlineInputBorder()),
                obscureText: true,
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                  child: Text('Sign up'),
                  onPressed: () {}
              ),
            ],
          ),
        ),

    );
  }
}