import 'dart:convert';
import 'package:flutter/material.dart';
import 'common_api.dart';

class UserAPI extends CommonAPI {
  UserAPI({BuildContext context, bool listen}) : super(context, listen: listen);

  // 날씨 API 불러오기
  Future<Map<String, dynamic>> getWeather_() async {
    final response = await getWeather(
        'https://api.openweathermap.org/data/2.5/weather?lat=37.8570328&lon=127.7397966&appid=8dd13edf7d3512a5f100606b7f660691',
        headers: {},
        params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "main_weather": result['weather'][0]['main'],
      "description": result['weather'][0]['description'],
      "temp": (result['main']['temp'] - 273.15).round(),
      "iconId": result['weather'][0]['icon']
    };
  }

  // Naver Map path 불러오기
  Future<Map<String, dynamic>> getPath_({
    String Lat1,
    String Lng1,
    String Lat2,
    String Lng2,
    String Lat3,
    String Lng3,
    String Lat4,
    String Lng4,
    String Lat5,
    String Lng5,
  }) async {
    final response = await getPath(
        'https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?start=$Lng1,$Lat1&goal=$Lng5,$Lat5&waypoints=$Lng2,$Lat2|$Lng3,$Lat3|$Lng4,$Lat4&option=trafast',
        headers: {
          "X-NCP-APIGW-API-KEY-ID": "as65du43vl",
          "X-NCP-APIGW-API-KEY": "vwZVWIcJbjPwM94keIEdxKen8DhveB0QE3dheiZ7"
        },
        params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "code": result['code'],
      "message": result['message'],
      "currentDateTime": result['currentDateTime'],
      "route": result['route']
    };
  }

  // 유저 정보 불러오기
  Future<Map<String, dynamic>> getUser({int pk}) async {
    final response = await get('groad/user/$pk', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "id": result['gu_seq'],
      "gu_id": result['gu_id'],
      "gu_pw": result['gu_pw'],
      "gu_name": result['gu_name'],
      "gu_gender": result['gu_gender'],
      "gu_birth_date": result['gu_birth_date'],
      "gu_email": result['gu_email'],
      "gu_phone_number": result['gu_phone_number'],
      "gu_point_number": result['gu_point_number'],
      "gu_step_number": result['gu_step_number'],
      "gu_profile_image": result['gu_profile_image']
    };
  }

  Future<dynamic> getUserAll() async {
    final response = await get('groad/user/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 로그인 시도 (성공하면 id값 반환)
  Future<Map<String, dynamic>> user_login({String id, String pw}) async {
    final response = await post('groad/user/login/',
        body: {"gu_id": id, "gu_pw": pw}, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"gu_seq": result['gu_seq']};
  }

  // 새 계정 생성
  Future<Map<String, dynamic>> createUser(
      {String id,
      String pw,
      String name,
      String gender,
      String birth,
      String email,
      String phone,
      String profileImage}) async {
    final response = await post('groad/user/', body: {
      "gu_id": id,
      "gu_pw": pw,
      "gu_name": name,
      "gu_gender": gender,
      "gu_birth_date": birth,
      "gu_email": email,
      "gu_phone_number": phone,
      "gu_profile_image": profileImage,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  //계정 수정
  Future<Map<String, dynamic>> updateUser(
      {int pk,
      String id,
      String pw,
      String name,
      String gender,
      String birth,
      String email,
      String phone,
      int point,
      double step,
      String profileImage}) async {
    final response = await put('groad/user/$pk/', body: {
      "gu_id": id,
      "gu_pw": pw,
      "gu_name": name,
      "gu_gender": gender,
      "gu_birth_date": birth,
      "gu_email": email,
      "gu_phone_number": phone,
      "gu_point_number": point,
      "gu_step_number": step,
      "gu_profile_image": profileImage
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 계정 삭제
  Future<Map<String, dynamic>> deleteUser({int pk}) async {
    final request =
        await delete('groad/user/$pk', body: {}, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }

  // 문의사항 조회_detail
  Future<dynamic> getInquiryDetail({int fk}) async {
    final response = await get('groad/inquiry/$fk', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 문의사항 생성
  Future<Map<String, dynamic>> createInquiry(
      {String title, String contents, int fk}) async {
    final request = await post('groad/inquiry/', body: {
      "gi_title": title,
      "gi_contents": contents,
      "gi_gu_seq_id": fk,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }

  // 사용자후기 조회_전체
  Future<dynamic> getReview() async {
    final response = await get('groad/review/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 사용자후기 조회_detail
  Future<Map<String, dynamic>> getReviewDetail({int pk}) async {
    final response = await get('groad/review/$pk', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "gr_seq": result[0]['gr_seq'],
      "gr_name": result[0]['gr_name'],
      "gr_place": result[0]['gr_place'],
      "gr_content_text": result[0]['gr_content_text'],
      "gr_grade": result[0]['gr_grade'],
      "gr_date": result[0]['gr_date'],
      "gr_content_image": result[0]['gr_content_image'],
      "gr_profile_image": result[0]['gr_profile_image'],
      "gr_gu_seq_id": result[0]['gr_gu_seq_id'],
    };
  }

  // 사용자후기 생성
  Future<Map<String, dynamic>> createReview(
      {String name,
      String place,
      String contentText,
      int grade,
      String date,
      String contentImage,
      String profileImage,
      int fk}) async {
    final request = await post('groad/review/', body: {
      "gr_name": name,
      "gr_place": place,
      "gr_content_text": contentText,
      "gr_grade": grade,
      "gr_date": date,
      "gr_content_image": contentImage,
      "gr_profile_image": profileImage,
      "gr_gu_seq_id": fk,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }

  // 사용자후기 수정
  Future<Map<String, dynamic>> updateReview(
      {String name,
      String place,
      String contentText,
      int grade,
      String date,
      String contentImage,
      String profileImage,
      int pk,
      int fk}) async {
    final response = await put('groad/review/$pk/', body: {
      "gr_name": name,
      "gr_place": place,
      "gr_content_text": contentText,
      "gr_grade": grade,
      "gr_gu_seq_id": fk,
      "gr_date": date,
      "gr_content_image": contentImage,
      "gr_profile_image": profileImage
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 사용자후기 삭제
  Future<Map<String, dynamic>> deleteReview({int pk}) async {
    final request =
        await delete('groad/review/$pk/', body: {}, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }

  // 후기댓글 조회 (All)
  Future<dynamic> getReviewCommentAll() async {
    final response =
        await get('groad/review_comment/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 후기댓글 조회 (detail)
  Future<dynamic> getReviewComment({int fk}) async {
    final response =
        await get('groad/review_comment/$fk', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 후기댓글 생성
  Future<Map<String, dynamic>> createReviewComment(
      {String name, String profileImage, String commentText, int fk}) async {
    final request = await post('groad/review_comment/', body: {
      "grc_name": name,
      "grc_profile_image": profileImage,
      "grc_comment": commentText,
      "grc_gr_seq_id": fk,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }

  // 후기댓글 수정
  Future<Map<String, dynamic>> updateReviewComment(
      {String name,
      String profileImage,
      String commentText,
      int pk,
      int fk}) async {
    final response = await put('groad/review_comment/$pk', body: {
      "grc_name": name,
      "grc_profile_image": profileImage,
      "grc_comment": commentText,
      "grc_gr_seq_id": fk,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 알림 조회
  Future<Map<String, dynamic>> getSetting({int fk}) async {
    final response = await get('groad/setting/$fk', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "gs_seq": result[0]['gs_seq'],
      "gs_map": result[0]['gs_map'],
      "gs_theme": result[0]['gs_theme'],
      "gs_onoff1": result[0]['gs_onoff1'],
      "gs_onoff2": result[0]['gs_onoff2'],
      "gs_onoff3": result[0]['gs_onoff3'],
      "gs_gu_seq_id": result[0]['gs_gu_seq_id'],
    };
  }

  // 알림 생성
  Future<Map<String, dynamic>> createSetting(
      {int map,
      int themeColor,
      int onoff1,
      int onoff2,
      int onoff3,
      int fk}) async {
    final request = await post('groad/setting/', body: {
      "gs_map": map,
      "gs_theme": themeColor,
      "gs_onoff1": onoff1,
      "gs_onoff2": onoff2,
      "gs_onoff3": onoff3,
      "gs_gu_seq_id": fk
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }

  // 알림 수정
  Future<Map<String, dynamic>> updateSetting(
      {int map,
      int themeColor,
      int onoff1,
      int onoff2,
      int onoff3,
      int fk}) async {
    final response = await put('groad/setting/$fk', body: {
      "gs_map": map,
      "gs_theme": themeColor,
      "gs_onoff1": onoff1,
      "gs_onoff2": onoff2,
      "gs_onoff3": onoff3,
      "gs_gu_seq_id": fk
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 코스 정보 조회
  Future<dynamic> getTravelCourse() async {
    final response = await get('groad/travelcourse/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 제1 코스 거점 정보 조회
  Future<dynamic> getCourse1Position() async {
    final response =
        await get('groad/course1position/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 제2 코스 거점 정보 조회
  Future<dynamic> getCourse2Position() async {
    final response =
        await get('groad/course2position/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 제3 코스 거점 정보 조회
  Future<dynamic> getCourse3Position() async {
    final response =
        await get('groad/course3position/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 제4 코스 거점 정보 조회
  Future<dynamic> getCourse4Position() async {
    final response =
        await get('groad/course4position/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 제5 코스 거점 정보 조회
  Future<dynamic> getCourse5Position() async {
    final response =
        await get('groad/course5position/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 제6 코스 거점 정보 조회
  Future<dynamic> getCourse6Position() async {
    final response =
        await get('groad/course6position/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 제7 코스 거점 정보 조회
  Future<dynamic> getCourse7Position() async {
    final response =
        await get('groad/course7position/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 제8 코스 거점 정보 조회
  Future<dynamic> getCourse8Position() async {
    final response =
        await get('groad/course8position/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 제9 코스 거점 정보 조회
  Future<dynamic> getCourse9Position() async {
    final response =
        await get('groad/course9position/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 카페 리스트 조회
  Future<dynamic> getCafeList() async {
    final response = await get('groad/cafe_list/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 포토스팟 리스트 조회
  Future<dynamic> getPhotoList() async {
    final response = await get('groad/photo_list/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 맛집 리스트 조회
  Future<dynamic> getRestaurantList() async {
    final response =
        await get('groad/restaurant_list/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  // 숙소 리스트 조회
  Future<dynamic> getLodgingList() async {
    final response = await get('groad/lodging_list/', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }
}
