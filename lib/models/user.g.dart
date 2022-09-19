// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    su_seq: json['su_seq'] as int,
    hour_drug1: json['hour_drug1'] as int,
    hour_drug2: json['hour_drug2'] as int,
    hour_drug3: json['hour_drug3'] as int,
    hour_hello: json['hour_hello'] as int,
    hour_exer: json['hour_exer'] as int,
    min_drug1: json['min_drug1'] as int,
    min_drug2: json['min_drug2'] as int,
    min_drug3: json['min_drug3'] as int,
    min_hello: json['min_hello'] as int,
    min_exer: json['min_exer'] as int,
    date: json['date'] != null
        ? DateTime.parse(json['date'] as String)
        : null,
    phone1: json['phone1'] as String,
    phone2: json['phone2'] as String,
    phone3: json['phone3'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{

  'hour_drug1': instance.hour_drug1,
  'hour_drug2': instance.hour_drug2,
  'hour_drug3': instance.hour_drug3,
  'hour_hello': instance.hour_hello,
  'hour_exer': instance.hour_exer,
  'min_drug1': instance.min_drug1,
  'min_drug2': instance.min_drug2,
  'min_drug3': instance.min_drug3,
  'min_hello': instance.min_hello,
  'min_exer': instance.min_exer,
  'date': instance.date?.toIso8601String(),
  'phone1': instance.phone1,
  'phone2': instance.phone2,
  'phone3': instance.phone3,
};
