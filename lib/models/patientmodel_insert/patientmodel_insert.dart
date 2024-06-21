import 'package:json_annotation/json_annotation.dart';

part 'patientmodel_insert.g.dart';

@JsonSerializable()
class PatientmodelInsert {
  String? name;
  String? excecutive;
  String? payment;
  String? phone;
  String? address;
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
  String? id = '';
  List<String> male; // Assuming treatment ids are strings
  List<String> female;
  String? branch;
  List<String> treatments;

  PatientmodelInsert({
    required this.name,
    required this.excecutive,
    required this.payment,
    required this.phone,
    required this.address,
    required this.totalAmount,
    required this.discountAmount,
    required this.advanceAmount,
    required this.balanceAmount,
    required this.dateNdTime,
    this.id = '', // Pass empty string as default
    required this.male,
    required this.female,
    required this.branch,
    required this.treatments,
  });

  factory PatientmodelInsert.fromJson(Map<String, dynamic> json) {
    return _$PatientmodelInsertFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientmodelInsertToJson(this);
}
