// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loginresponse _$LoginresponseFromJson(Map<String, dynamic> json) =>
    Loginresponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      isSuperuser: json['is_superuser'] as bool?,
      userDetails: json['user_details'] == null
          ? null
          : UserDetails.fromJson(json['user_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginresponseToJson(Loginresponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'is_superuser': instance.isSuperuser,
      'user_details': instance.userDetails,
    };
