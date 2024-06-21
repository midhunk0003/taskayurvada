import 'package:json_annotation/json_annotation.dart';

import 'patientdetails_set.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  int? id;
  @JsonKey(name: 'patientdetails_set')
  List<PatientdetailsSet>? patientdetailsSet;
  dynamic branch;
  String? user;
  String? payment;
  String? name;
  String? phone;
  String? address;
  dynamic price;
  @JsonKey(name: 'total_amount')
  int? totalAmount;
  @JsonKey(name: 'discount_amount')
  int? discountAmount;
  @JsonKey(name: 'advance_amount')
  int? advanceAmount;
  @JsonKey(name: 'balance_amount')
  int? balanceAmount;
  @JsonKey(name: 'date_nd_time')
  String? dateNdTime;
  @JsonKey(name: 'is_active')
  bool? isActive;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Patient({
    this.id,
    this.patientdetailsSet,
    this.branch,
    this.user,
    this.payment,
    this.name,
    this.phone,
    this.address,
    this.price,
    this.totalAmount,
    this.discountAmount,
    this.advanceAmount,
    this.balanceAmount,
    this.dateNdTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return _$PatientFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
