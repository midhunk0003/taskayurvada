// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tretmentlistmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tretmentlistmodel _$TretmentlistmodelFromJson(Map<String, dynamic> json) =>
    Tretmentlistmodel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      treatments: (json['treatments'] as List<dynamic>?)
          ?.map((e) => Treatment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TretmentlistmodelToJson(Tretmentlistmodel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'treatments': instance.treatments,
    };
