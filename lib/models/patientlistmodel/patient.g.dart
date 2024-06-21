// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: (json['id'] as num?)?.toInt(),
      patientdetailsSet: (json['patientdetails_set'] as List<dynamic>?)
          ?.map((e) => PatientdetailsSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      branch: json['branch'],
      user: json['user'] as String?,
      payment: json['payment'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      price: json['price'],
      totalAmount: (json['total_amount'] as num?)?.toInt(),
      discountAmount: (json['discount_amount'] as num?)?.toInt(),
      advanceAmount: (json['advance_amount'] as num?)?.toInt(),
      balanceAmount: (json['balance_amount'] as num?)?.toInt(),
      dateNdTime: json['date_nd_time'] as String?,
      isActive: json['is_active'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'id': instance.id,
      'patientdetails_set': instance.patientdetailsSet,
      'branch': instance.branch,
      'user': instance.user,
      'payment': instance.payment,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'price': instance.price,
      'total_amount': instance.totalAmount,
      'discount_amount': instance.discountAmount,
      'advance_amount': instance.advanceAmount,
      'balance_amount': instance.balanceAmount,
      'date_nd_time': instance.dateNdTime,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
