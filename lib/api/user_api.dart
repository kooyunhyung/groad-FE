import 'dart:convert';
import 'package:flutter/material.dart';
import 'common_api.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../state/auth_state.dart';

class UserAPI extends CommonAPI {
  UserAPI({BuildContext context, bool listen}) : super(context, listen: listen);

  // Intro Page에서 로그인 시도에 사용
  Future<Map<String, dynamic>> getNumber({int id}) async {
    final response = await get('/medi/myphone/$id', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "id": result['id'],
      "robotNumber": result['phone1'],
    };
  }

  // 로그인 시도 (성공하면 id값 반환)
  Future<Map<String, dynamic>> loginNumber({String number}) async {
    final response = await post('/medi/myphone/login', body: {
      "phone1": number,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "id": result['id'],
      "robotNumber": result['phone1'],
    };
  }

  // 새 계정 생성
  Future<Map<String, dynamic>> setNumber() async {
    final response = await post('/medi/myphone/insert', body: {
      "phone1": "medi003",
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 약 먹는 시간 조회
  Future<Map<String, dynamic>> getAlarmTime1({int id}) async {
    final response = await get('/medi/drug/$id', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "id": result['id'],
      "hour_drug1": result['hour_drug1'],
      "min_drug1": result['min_drug1'],
      "hour_drug2": result['hour_drug2'],
      "min_drug2": result['min_drug2'],
      "hour_drug3": result['hour_drug3'],
      "min_drug3": result['min_drug3'],
      "my_phone_id": result['my_phone_id'],
      if(result['detail'] != null) "detail" : result['detail']
    };
  }

  // 생활 알림 조회
  Future<Map<String, dynamic>> getAlarmTime2({int id}) async {
    final response = await get('/medi/life/$id', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "id": result['id'],
      "hour_hello": result['hour_hello'],
      "min_hello": result['min_hello'],
      "hour_exer": result['hour_exer'],
      "min_exer": result['min_exer'],
      "my_phone_id": result['my_phone_id'],
      if(result['detail'] != null) "detail" : result['detail']
    };
  }

  // 약 먹는 시간 생성
  Future<Map<String, dynamic>> insertAlarmTime1(
      int id, int hour1, int min1, int hour2, int min2, int hour3, int min3) async {
    final response = await post('/medi/drug/insert', body: {
      "my_phone_id" : id,
      "hour_drug1" : hour1,
      "min_drug1" : min1,
      "hour_drug2" : hour2,
      "min_drug2" : min2,
      "hour_drug3" : hour3,
      "min_drug3" : min3,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 생활 알림 생성
  Future<Map<String, dynamic>> insertAlarmTime2(
      int id, int hour1, int min1, int hour2, int min2) async {
    final response = await post('/medi/life/insert', body: {
      "my_phone_id" : id,
      "hour_hello" : hour1,
      "min_hello" : min1,
      "hour_exer" : hour2,
      "min_exer" : min2,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 약 먹는 시간 수정
  Future<Map<String, dynamic>> setAlarmTime1(
      int id, int hour1, int min1, int hour2, int min2, int hour3, int min3) async {
    final response = await post('/medi/drug/update', body: {
      "my_phone_id" : id,
      "hour_drug1" : hour1,
      "min_drug1" : min1,
      "hour_drug2" : hour2,
      "min_drug2" : min2,
      "hour_drug3" : hour3,
      "min_drug3" : min3,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 생활 알림 수정
  Future<Map<String, dynamic>> setAlarmTime2(
      int id, int hour1, int min1, int hour2, int min2) async {
    final response = await post('/medi/life/update', body: {
      "my_phone_id" : id,
      "hour_hello" : hour1,
      "min_hello" : min1,
      "hour_exer" : hour2,
      "min_exer" : min2,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  //보호자 정보 조회
  Future<Map<String, dynamic>> getGuardInfo({int id}) async {
    final response = await get('/medi/otherphone/$id', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "id": result['id'],
      "phone2" : result['phone2'],
      "phone3" : result['phone3'],
      "my_phone_id": result['my_phone_id']
    };
  }

  // 보호자 정보 수정
  Future<Map<String, dynamic>> setGuardInfo(
      int id, String phone2, String phone3) async {
    final response = await post('/medi/otherphone/update', body: {
      "id" : id,
      "phone2" : phone2,
      "phone3" : phone3,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 보호자 정보 생성
  Future<Map<String, dynamic>> insertGuardInfo(
      int id, String phone2, String phone3) async {
    final request = await post('/medi/otherphone/insert', body: {
      "my_phone_id" : id,
      "phone2" : phone2,
      "phone3" : phone3,
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }

  // 건강 정보 생성
  Future<Map<String, dynamic>> insertHealthInfo(
      String date, int id) async {
    final request = await post('/medi/health/insert', body: {
      "date" : date,              // 날짜 데이터
      "my_phone_id" : id,         // 내 전화번호 테이블 ID
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }

  // 건강 정보 조회
  Future<Map<String, dynamic>> getHealthInfo({int id}) async {
    final response = await get('/medi/health/$id', headers: {}, params: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {
      "code": result['code'],                           // 응답코드
      "health_info_list": result['health_info_list'],   // 내 건강정보 리스트
      "id": result['id'],                               // 건강정보 테이블 ID
      "date": result['date'],                           // 날짜 데이터
      "bl_sug" : result['bl_sug'],                      // 혈당
      "bl_pre_high" : result['bl_pre_high'],            // 최고 혈압
      "bl_pre_low": result['bl_pre_low'],               // 최저 혈압
      "liv_sh": result['liv_sh'],                       // 간수치
      "robotNumber" : result['my_phone_id']             // 내 전화번호 테이블 ID
    };
  }

  // 건강 정보 수정
  Future<Map<String, dynamic>> setHealthInfo(
      int pk_id, int fk_id, String date, int bl_sug, int bl_pre_high, int bl_pre_low, int liv_sh) async {
    final response = await post('/medi/health/update', body: {
      "id" : pk_id,                     // 건강정보 테이블 ID
      "my_phone_id" : fk_id,            // 내 전화번호 테이블 ID
      "date" : date,                    // 날짜 데이터
      "bl_sug" : bl_sug,                // 혈당
      "bl_pre_high" : bl_pre_high,      // 최고 혈압
      "bl_pre_low" : bl_pre_low,        // 최저 혈압
      "liv_sh" : liv_sh                 // 간수치
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return {"code": result['code']};
  }

  // 건강 정보 삭제
  Future<Map<String, dynamic>> deleteHealthInfo(
      int pk_id) async {
    final request = await post('/medi/health/delete', body: {
      "id" : pk_id,                   // 건강정보 테이블 ID
    }, params: {}, headers: {});
    final result = jsonDecode(utf8.decode(request.bodyBytes));
    return {"code": result['code']};
  }
}