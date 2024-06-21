// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patientdetails_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientdetailsSet _$PatientdetailsSetFromJson(Map<String, dynamic> json) =>
    PatientdetailsSet(
      id: (json['id'] as num?)?.toInt(),
      male: json['male'] as String?,
      female: json['female'] as String?,
      patient: (json['patient'] as num?)?.toInt(),
      treatment: json['treatment'],
    );

Map<String, dynamic> _$PatientdetailsSetToJson(PatientdetailsSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'male': instance.male,
      'female': instance.female,
      'patient': instance.patient,
      'treatment': instance.treatment,
    };
