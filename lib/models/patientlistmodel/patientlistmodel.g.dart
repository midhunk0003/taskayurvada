// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patientlistmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patientlistmodel _$PatientlistmodelFromJson(Map<String, dynamic> json) =>
    Patientlistmodel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      patient: (json['patient'] as List<dynamic>?)
          ?.map((e) => Patient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PatientlistmodelToJson(Patientlistmodel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'patient': instance.patient,
    };
