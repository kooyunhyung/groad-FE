import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gload_app/api/user_api.dart';
import 'package:image_picker/image_picker.dart';
import '../../../component/common_button.dart';
import '../../../component/dialog/notify_dialog.dart';
import '../../../constant/theme.dart';
import '../../frame/common_frame1.dart';
import '../../frame/common_frame2.dart';
import '../home.dart';
import 'traveler_review.dart';

class TravelerReviewWrite extends StatefulWidget {
  TravelerReviewWrite({Key key, this.idKey, this.userInfo, this.mapType, this.themeColor})
      : super(key: key);

  int idKey;
  int mapType;
  int themeColor;
  dynamic userInfo;

  @override
  _TravelerReviewWriteState createState() => _TravelerReviewWriteState();
}

class _TravelerReviewWriteState extends State<TravelerReviewWrite> {
  bool star1 = true;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
  bool star5 = false;
  TextEditingController place = TextEditingController();
  TextEditingController content_text = TextEditingController();
  int grade;
  final imgBBkey = '0546c22e94c94bf76ece9bca3e0542f2';
  Dio dio = new Dio();
  dynamic imageUriResponse;

  final ImagePicker _picker = ImagePicker();
  XFile _image;

  @override
  void initState() {
    if(widget.mapType==null){
      widget.mapType=0;
    }
    if (widget.idKey == null) {
      widget.idKey = -1;
    }
    if (widget.themeColor == null) {
      widget.themeColor = 0;
    }
    // TODO: implement initState
    super.initState();
    grade = 1;
    _image = null;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
                controller: content_text,
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
                  _image == null
                      ? GestureDetector(
                          onTap: () {
                            _getImage();
                          },
                          child: Container(
                            width: width * 0.24,
                            height: width * 0.24,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Icon(
                              Icons.add,
                              color: Colors.grey,
                            )),
                          ),
                        )
                      : Container(
                          width: width * 0.24,
                          height: width * 0.24,
                          child: Image.file(File(_image.path)),
                        ),
                  SizedBox(
                    width: 20,
                  ),
                  _image != null
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _image = null;
                            });
                          },
                          child: Icon(
                            Icons.delete,
                            size: 40,
                          ))
                      : Container(),
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
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          star1 = true;
                          star2 = false;
                          star3 = false;
                          star4 = false;
                          star5 = false;
                          grade = 1;
                        });
                      },
                      child: star1
                          ? Icon(
                              Icons.star_rounded,
                              size: 75,
                              color: widget.themeColor == 0
                                  ? Color(ThemeColors.deepNavy)
                                  : widget.themeColor == 1
                                      ? ThemeColors.deepGreen
                                      : ThemeColors.deepOrange,
                            )
                          : Icon(Icons.star_border_rounded, size: 75)),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          star1 = true;
                          star2 = true;
                          star3 = false;
                          star4 = false;
                          star5 = false;
                          grade = 2;
                        });
                      },
                      child: star2
                          ? Icon(
                              Icons.star_rounded,
                              size: 75,
                              color: widget.themeColor == 0
                                  ? Color(ThemeColors.deepNavy)
                                  : widget.themeColor == 1
                                      ? ThemeColors.deepGreen
                                      : ThemeColors.deepOrange,
                            )
                          : Icon(Icons.star_border_rounded, size: 75)),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          star1 = true;
                          star2 = true;
                          star3 = true;
                          star4 = false;
                          star5 = false;
                          grade = 3;
                        });
                      },
                      child: star3
                          ? Icon(
                              Icons.star_rounded,
                              size: 75,
                              color: widget.themeColor == 0
                                  ? Color(ThemeColors.deepNavy)
                                  : widget.themeColor == 1
                                      ? ThemeColors.deepGreen
                                      : ThemeColors.deepOrange,
                            )
                          : Icon(Icons.star_border_rounded, size: 75)),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          star1 = true;
                          star2 = true;
                          star3 = true;
                          star4 = true;
                          star5 = false;
                          grade = 4;
                        });
                      },
                      child: star4
                          ? Icon(
                              Icons.star_rounded,
                              size: 75,
                              color: widget.themeColor == 0
                                  ? Color(ThemeColors.deepNavy)
                                  : widget.themeColor == 1
                                      ? ThemeColors.deepGreen
                                      : ThemeColors.deepOrange,
                            )
                          : Icon(Icons.star_border_rounded, size: 75)),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          star1 = true;
                          star2 = true;
                          star3 = true;
                          star4 = true;
                          star5 = true;
                          grade = 5;
                        });
                      },
                      child: star5
                          ? Icon(
                              Icons.star_rounded,
                              size: 75,
                              color: widget.themeColor == 0
                                  ? Color(ThemeColors.deepNavy)
                                  : widget.themeColor == 1
                                      ? ThemeColors.deepGreen
                                      : ThemeColors.deepOrange,
                            )
                          : Icon(Icons.star_border_rounded, size: 75)),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              CommonButton(
                themeColor: widget.themeColor,
                label: '작성 완료',
                onPress: () async {
                  if (widget.idKey == -1) {
                    NotifyDialog.show(context,
                        style: TextStyle(
                            fontSize: 50,
                            color: ThemeColors.black,
                            height: 23 / 18),
                        message: '로그인 후 작성 가능합니다.');
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
                  if (content_text.text == '') {
                    NotifyDialog.show(context,
                        style: TextStyle(
                            fontSize: 50,
                            color: ThemeColors.black,
                            height: 23 / 18),
                        message: '후기 내용을 입력하지 않았습니다.');
                    return;
                  }
                  if (_image == null) {
                    NotifyDialog.show(context,
                        style: TextStyle(
                            fontSize: 50,
                            color: ThemeColors.black,
                            height: 23 / 18),
                        message: '사진 등록을 하지 않았습니다.');
                    return;
                  }

                  if (_image != null) {
                    try {
                      NotifyDialog.show(context,
                          style: TextStyle(
                              fontSize: 50,
                              color: ThemeColors.black,
                              height: 23 / 18),
                          message: '잠시만 기다려주세요.');
                      imageUriResponse = await uploadImageFile(_image);
                    } catch (e) {
                      print(e);
                    }
                  }
                  try {
                    final result = await UserAPI(context: context).createReview(
                        name: widget.userInfo['gu_name'],
                        place: place.text,
                        contentText: content_text.text,
                        grade: grade,
                        date: DateTime.now().toString(),
                        contentImage: imageUriResponse['data']['url'],
                        profileImage: widget.userInfo['gu_profile_image'],
                        fk: widget.idKey);
                    print(result['code']);
                  } catch (e) {
                    print(e);
                  }
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => CommonFrame1(
                          userInfo: widget.userInfo,
                          idKey: widget.idKey,
                          mapType: widget.mapType,
                          themeColor: widget.themeColor,
                          title: "GROAD",
                          clas: Home(
                            userInfo: widget.userInfo,
                            idKey: widget.idKey,
                            mapType: widget.mapType,
                            themeColor: widget.themeColor,
                          ),
                        ),
                      ),
                          (route) => false);
                  NotifyDialog.show(context,
                      style: TextStyle(
                          fontSize: 50,
                          color: ThemeColors.black,
                          height: 23 / 18),
                      message: '작성이 완료되었습니다.');
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> uploadImageFile(
    XFile media,
  ) async {
    File _media = File(media.path);

    ByteData bytes = _media.readAsBytesSync().buffer.asByteData();
    var buffer = bytes.buffer;
    var m = base64.encode(Uint8List.view(buffer));

    FormData formData = FormData.fromMap({"key": imgBBkey, "image": m});
    Response response = await dio.post(
      "https://api.imgbb.com/1/upload",
      data: formData,
    );
    return response.data;
  }

  Future _getImage() async {
    XFile image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
