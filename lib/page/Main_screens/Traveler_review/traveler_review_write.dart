import 'package:flutter/material.dart';

import '../../../component/common_button.dart';
import '../../../component/dialog/notify_dialog.dart';
import '../../../constant/theme.dart';

class TravelerReviewWrite extends StatefulWidget {
  const TravelerReviewWrite({Key key}) : super(key: key);

  @override
  _TravelerReviewWriteState createState() => _TravelerReviewWriteState();
}

class _TravelerReviewWriteState extends State<TravelerReviewWrite> {
  bool star1 = true;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
  bool star5 = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    TextEditingController name = TextEditingController();
    TextEditingController place = TextEditingController();
    TextEditingController comment = TextEditingController();

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
                    '이름 *',
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
                    '장소 *',
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
                          controller: place,
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
              TextField(
                style: TextStyle(fontSize: 20),
                minLines: 10,
                maxLines: 10,
                maxLength: 1000,
                controller: comment,
                decoration: InputDecoration(
                    hintText: '후기를 입력해주세요.(최대 1000자)',
                    hintStyle: TextStyle(color: Colors.grey[350]),
                    counterText: '',
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.5, color: ThemeColors.black)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.5, color: ThemeColors.gray1))),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '사진 등록 *',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.black,
                    ),
                  ),
                  Text(
                    '0장 / 최대 8장',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey[300]),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: width * 0.24,
                      height: width * 0.24,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.grey,
                      )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  '평점 주기',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(onTap: (){
                    setState(() {
                      star1=true;
                      star2=false;
                      star3=false;
                      star4=false;
                      star5=false;
                    });
                  }, child:star1?Icon(Icons.star_rounded, size: 75,color: Color(ThemeColors.deepNavy),):Icon(Icons.star_border_rounded, size: 75)),
                  GestureDetector(onTap: (){
                    setState(() {
                      star1=true;
                      star2=true;
                      star3=false;
                      star4=false;
                      star5=false;
                    });
                  }, child:star2?Icon(Icons.star_rounded, size: 75,color: Color(ThemeColors.deepNavy),):Icon(Icons.star_border_rounded, size: 75)),
                  GestureDetector(onTap: (){
                    setState(() {
                      star1=true;
                      star2=true;
                      star3=true;
                      star4=false;
                      star5=false;
                    });
                  }, child:star3?Icon(Icons.star_rounded, size: 75,color: Color(ThemeColors.deepNavy),):Icon(Icons.star_border_rounded, size: 75)),
                  GestureDetector(onTap: (){
                    setState(() {
                      star1=true;
                      star2=true;
                      star3=true;
                      star4=true;
                      star5=false;
                    });
                  }, child:star4?Icon(Icons.star_rounded, size: 75,color: Color(ThemeColors.deepNavy),):Icon(Icons.star_border_rounded, size: 75)),
                  GestureDetector(onTap: (){
                    setState(() {
                      star1=true;
                      star2=true;
                      star3=true;
                      star4=true;
                      star5=true;
                    });
                  }, child:star5?Icon(Icons.star_rounded, size: 75,color: Color(ThemeColors.deepNavy),):Icon(Icons.star_border_rounded, size: 75)),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              CommonButton(
                label: '작성 완료',
                onPress: () {
                  if (name.text == '') {
                    NotifyDialog.show(context,
                        style: TextStyle(
                            fontSize: 50,
                            color: ThemeColors.black,
                            height: 23 / 18),
                        message: '이름을 입력하지 않았습니다.');
                    return;
                  }
                  if (place.text == '') {
                    NotifyDialog.show(context,
                        style: TextStyle(
                            fontSize: 50,
                            color: ThemeColors.black,
                            height: 23 / 18),
                        message: '장소를 선택하지 않았습니다.');
                    return;
                  }
                  if (comment.text == '') {
                    NotifyDialog.show(context,
                        style: TextStyle(
                            fontSize: 50,
                            color: ThemeColors.black,
                            height: 23 / 18),
                        message: '후기 내용을 입력하지 않았습니다.');
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
