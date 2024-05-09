// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['code'] as String,
      json['name'] as String,
      json['id'] as String,
      json['area'] as String,
      json['mixer1'] as double,
      json['mixer2'] as double,
      json['mixer3'] as double,
      json['cycle'] as int,
      json['starttime'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'id': instance.id,
      'area': instance.area,
      'mixer1': instance.mixer1,
      'mixer2': instance.mixer2,
      'mixer3': instance.mixer3,
      'cycle': instance.cycle,
      'starttime': instance.starttime,
    };
