// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branchlistmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branchlistmodel _$BranchlistmodelFromJson(Map<String, dynamic> json) =>
    Branchlistmodel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BranchlistmodelToJson(Branchlistmodel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'branches': instance.branches,
    };
