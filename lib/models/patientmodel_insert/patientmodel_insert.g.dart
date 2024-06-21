// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patientmodel_insert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientmodelInsert _$PatientmodelInsertFromJson(Map<String, dynamic> json) =>
    PatientmodelInsert(
      name: json['name'] as String?,
      excecutive: json['excecutive'] as String?,
      payment: json['payment'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      totalAmount: (json['total_amount'] as num?)?.toInt(),
      discountAmount: (json['discount_amount'] as num?)?.toInt(),
      advanceAmount: (json['advance_amount'] as num?)?.toInt(),
      balanceAmount: (json['balance_amount'] as num?)?.toInt(),
      dateNdTime: json['date_nd_time'] as String?,
      id: json['id'] as String? ?? '',
      male: (json['male'] as List<dynamic>).map((e) => e as String).toList(),
      female:
          (json['female'] as List<dynamic>).map((e) => e as String).toList(),
      branch: json['branch'] as String?,
      treatments: (json['treatments'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PatientmodelInsertToJson(PatientmodelInsert instance) =>
    <String, dynamic>{
      'name': instance.name,
      'excecutive': instance.excecutive,
      'payment': instance.payment,
      'phone': instance.phone,
      'address': instance.address,
      'total_amount': instance.totalAmount,
      'discount_amount': instance.discountAmount,
      'advance_amount': instance.advanceAmount,
      'balance_amount': instance.balanceAmount,
      'date_nd_time': instance.dateNdTime,
      'id': instance.id,
      'male': instance.male,
      'female': instance.female,
      'branch': instance.branch,
      'treatments': instance.treatments,
    };
