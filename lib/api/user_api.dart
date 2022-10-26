import 'dart:convert';
import 'package:flutter/material.dart';
import 'common_api.dart';

class UserAPI extends CommonAPI {
  UserAPI({BuildContext context, bool listen}) : super(context, listen: listen);

  // Naver Map path 불러오기
  Future<Map<String, dynamic>> getPath_1() async {
    final response = await getPath1('https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?start=127.692045,37.980143&goal=127.725276,37.8938973&waypoints=127.5790956,37.9679432|127.7253862,37.9232548|127.7234127,37.8933383&option=trafast',
        headers: {
          "X-NCP-APIGW-API-KEY-ID": "as65du43vl",
          "X-NCP-APIGW-API-KEY" : "vwZVWIcJbjPwM94keIEdxKen8DhveB0QE3dheiZ7"
        }, params: {});
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
    final response = await get('/groad/user/$pk', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "id": result['gu_seq'],
      "gu_id": result['gu_id'],
      "gu_pw": result['gu_pw'],
      "gu_name": result['gu_name'],
      "gu_gender": result['gu_gender'],
      "gu_birth_date": result['gu_birth_date'],
      "gu_email": result['gu_email'],
      "gu_phone_number": result['gu_phone_number']
    };
  }

  // 로그인 시도 (성공하면 id값 반환)
  Future<Map<String, dynamic>> user_login({String id, String pw}) async {
    final response = await post('groad/user/login/',
        body: {"gu_id": id, "gu_pw": pw}, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "gu_seq": result['gu_seq']
    };
  }

  // 새 계정 생성
  Future<Map<String, dynamic>> createUser(
      {String id,
      String pw,
      String name,
      String gender,
      String birth,
      String email,
      String phone}) async {
    final response = await post('groad/user/', body: {
      "gu_id": id,
      "gu_pw": pw,
      "gu_name": name,
      "gu_gender": gender,
      "gu_birth_date": birth,
      "gu_email": email,
      "gu_phone_number": phone
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
      String phone}) async {
    final response = await put('groad/user/$pk', body: {
      "gu_id": id,
      "gu_pw": pw,
      "gu_name": name,
      "gu_gender": gender,
      "gu_birth_date": birth,
      "gu_email": email,
      "gu_phone_number": phone
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 계정 삭제
  Future<Map<String, dynamic>> deleteUser({int pk}) async {
    final request =
        await delete('/groad/user/$pk', body: {}, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }

  // 걸음수 조회
  Future<Map<String, dynamic>> getPedometer({int fk}) async {
    final response = await get('/groad/pedometer/$fk', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "gp_seq": result['gp_seq'],
      "gp_step": result['gp_step'],
      "gp_gu_seq_id": result['gp_gu_seq_id'],
      if (result['detail'] != null) "detail": result['detail']
    };
  }

  // 걸음수 생성
  Future<Map<String, dynamic>> createPedometer({String step, int fk}) async {
    final response = await post('/groad/pedometer',
        body: {"gp_step": step, "gp_gu_seq_id": fk}, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 걸음수 수정
  Future<Map<String, dynamic>> updatePedometer({String step, int fk}) async {
    final response = await put('/groad/pedometer/$fk',
        body: {"gp_step": step, "gp_gu_seq_id": fk}, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 사용자후기 조회
  Future<Map<String, dynamic>> getReview({int fk}) async {
    final response = await get('/groad/review/$fk', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "gr_seq": result['gr_seq'],
      "gr_nickname": result['gr_nickname'],
      "gr_comment": result['gr_comment'],
      "gr_grade": result['gr_grade'],
      "gr_gu_seq_id": result['gr_gu_seq_id'],
      if (result['detail'] != null) "detail": result['detail']
    };
  }

  // 사용자후기 생성
  Future<Map<String, dynamic>> createReview(
      {String nickname,
      String place,
      String comment,
      int grade,
      int fk}) async {
    final request = await post('/groad/review', body: {
      "gr_nickname": nickname,
      "gr_place": place,
      "gr_comment": comment,
      "gr_grade": grade,
      "gr_gu_seq_id": fk,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }

  // 사용자후기 수정
  Future<Map<String, dynamic>> updateReview(
      {String nickname,
        String place,
        String comment,
        int grade,
        int fk})  async {
    final response = await put('/groad/review/$fk', body: {
      "gr_nickname": nickname,
      "gr_comment": comment,
      "gr_grade": grade,
      "gr_gu_seq_id": fk
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 사용자후기 삭제
  Future<Map<String, dynamic>> deleteReview({int fk}) async {
    final request =
    await delete('/groad/review/$fk', body: {}, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }

  // 알림 조회
  Future<Map<String, dynamic>> getAlarm({int fk}) async {
    final response = await get('/groad/alarm/$fk', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "ga_seq": result['ga_seq'],
      "ga_onoff1": result['ga_onoff1'],
      "ga_onoff2": result['ga_onoff2'],
      "ga_onoff3": result['ga_onoff3'],
      "ga_gu_seq_id": result['ga_gu_seq_id'],
      if(result['detail'] != null) "detail" : result['detail']
    };
  }

  // 알림 생성
  Future<Map<String, dynamic>> createAlarm({int onoff1, int onoff2, int onoff3, int fk}) async {
    final request = await post('/groad/alarm', body: {
      "ga_onoff1": onoff1,
      "ga_onoff2": onoff2,
      "ga_onoff3": onoff3,
      "ga_gu_seq_id": fk
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }

  // 알림 수정
  Future<Map<String, dynamic>> updateAlarm({int onoff1, int onoff2, int onoff3, int fk}) async {
    final response = await put('/groad/alarm/$fk', body: {
      "ga_onoff1": onoff1,
      "ga_onoff2": onoff2,
      "ga_onoff3": onoff3,
      "ga_gu_seq_id": fk
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // qrcode조회
  Future<Map<String, dynamic>> getQrcode({int fk}) async {
    final response = await get('/groad/qrcode/$fk', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "gq_seq": result['gq_seq'],
      "gq_qrcode": result['gq_qrcode'],
      "gq_gu_seq_id": result['gq_gu_seq_id'],
      if(result['detail'] != null) "detail" : result['detail']
    };
  }

  // qrcode 생성
  Future<Map<String, dynamic>> createQrcode({String qrcode, int fk}) async {
    final request = await post('/groad/qrcode', body: {
      "gq_qrcode": qrcode,
      "gq_gu_seq_id": fk,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }

  // qrcode수정
  Future<Map<String, dynamic>> updateQrcode({String qrcode, int fk}) async {
    final response = await put('/groad/qrcode/$fk', body: {
      "gq_qrcode": qrcode,
      "gq_gu_seq_id": fk
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }
}
