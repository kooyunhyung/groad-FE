import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int su_seq;
  int hour_drug1;         // 아침 시
  int hour_drug2;         // 점심 시
  int hour_drug3;         // 저녁 시
  int hour_hello;      // 아침 인사 시
  int hour_exer;     // 체조 시
  int min_drug1;          // 아침 분
  int min_drug2;          // 점심 분
  int min_drug3;          // 저녁 분
  int min_hello;       // 아침 인사 분
  int min_exer;      // 체조 분
  DateTime date;             // 날짜 정보
  int bl_sug;                     // 혈당
  int bl_pre_high;                  // 혈압 최고
  int bl_pre_low;                   // 혈압 최저
  int liv_sh;                       // 간수치
  String phone1;          // 내 전화번호 (unique)
  String phone2;          // 보호자 전화번호 2
  String phone3;          // 보호자 전화번호 3
  User({
    this.su_seq,
    this.hour_drug1,
    this.hour_drug2,
    this.hour_drug3,
    this.hour_hello,
    this.hour_exer,
    this.min_drug1,
    this.min_drug2,
    this.min_drug3,
    this.min_hello,
    this.min_exer,
    this.date,
    this.bl_sug,
    this.bl_pre_high,
    this.bl_pre_low,
    this.liv_sh,
    this.phone1,
    this.phone2,
    this.phone3
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
