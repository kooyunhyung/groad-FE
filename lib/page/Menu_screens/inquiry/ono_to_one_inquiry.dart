import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gload_app/component/common_button.dart';
import 'package:gload_app/component/dialog/notify_dialog.dart';
import 'package:gload_app/constant/theme.dart';

class OneToOneInquiry extends StatefulWidget {
  const OneToOneInquiry({Key key}) : super(key: key);

  @override
  State<OneToOneInquiry> createState() => _OneToOneInquiryState();
}

class _OneToOneInquiryState extends State<OneToOneInquiry> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController title = TextEditingController();
    TextEditingController contents = TextEditingController();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
        child: Container(
          color: ThemeColors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '이름',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.black,
                    ),
                  ),
                  Container(
                    width: width * 0.67,
                    height: height * 0.09,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextField(
                          style: TextStyle(fontSize: 20),
                          maxLength: 5,
                          controller: name,
                          decoration: InputDecoration(
                              counterText: '',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.5, color: ThemeColors.black)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.5, color: ThemeColors.gray1))),
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '이메일 *',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.black,
                    ),
                  ),
                  Container(
                    width: width * 0.67,
                    height: height * 0.09,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextField(
                          style: TextStyle(fontSize: 20),
                          maxLength: 30,
                          controller: email,
                          decoration: InputDecoration(
                              counterText: '',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.5, color: ThemeColors.black)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.5, color: ThemeColors.gray1))),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '제목 *',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.black,
                    ),
                  ),
                  Container(
                    width: width * 0.67,
                    height: height * 0.09,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextField(
                          style: TextStyle(fontSize: 20),
                          maxLength: 50,
                          controller: title,
                          decoration: InputDecoration(
                              counterText: '',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.5, color: ThemeColors.black)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.5, color: ThemeColors.gray1))),
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '문의내용 *',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(fontSize: 20),
                minLines: 10,
                maxLines: 10,
                maxLength: 180,
                controller: contents,
                decoration: InputDecoration(
                    hintText: '의견을 입력해주세요.(최대 180자)',
                    hintStyle: TextStyle(color: Colors.grey[350]),
                    counterText: '',
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.5, color: ThemeColors.black)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5, color: ThemeColors.gray1))),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
              ),
              SizedBox(
                height: 15,
              ),
              CommonButton(label: '전송하기',onPress: (){
                if(email.text==''){
                  NotifyDialog.show(context,
                      style: TextStyle(
                          fontSize: 50,
                          color: ThemeColors.black,
                          height: 23 / 18
                      ),
                      message: '이메일을 입력하지 않았습니다.'
                  );
                  return;
                }
                if(title.text==''){
                  NotifyDialog.show(context,
                      style: TextStyle(
                          fontSize: 50,
                          color: ThemeColors.black,
                          height: 23 / 18
                      ),
                      message: '제목을 입력하지 않았습니다.'
                  );
                  return;
                }
                if(contents.text==''){
                  NotifyDialog.show(context,
                      style: TextStyle(
                          fontSize: 50,
                          color: ThemeColors.black,
                          height: 23 / 18
                      ),
                      message: '문의내용을 입력하지 않았습니다.'
                  );
                  return;
                }
                Navigator.pop(context);
              },
              )
            ],
          ),
        ),
      ),
    );
  }
}
