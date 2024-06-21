import 'package:json_annotation/json_annotation.dart';

import 'patient.dart';

part 'patientlistmodel.g.dart';

@JsonSerializable()
class Patientlistmodel {
	bool? status;
	String? message;
	List<Patient>? patient;

	Patientlistmodel({this.status, this.message, this.patient});

	factory Patientlistmodel.fromJson(Map<String, dynamic> json) {
		return _$PatientlistmodelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$PatientlistmodelToJson(this);
}
