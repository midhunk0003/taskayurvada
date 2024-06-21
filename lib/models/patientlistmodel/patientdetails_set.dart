import 'package:json_annotation/json_annotation.dart';

part 'patientdetails_set.g.dart';

@JsonSerializable()
class PatientdetailsSet {
	int? id;
	String? male;
	String? female;
	int? patient;
	dynamic treatment;

	PatientdetailsSet({
		this.id, 
		this.male, 
		this.female, 
		this.patient, 
		this.treatment, 
	});

	factory PatientdetailsSet.fromJson(Map<String, dynamic> json) {
		return _$PatientdetailsSetFromJson(json);
	}

	Map<String, dynamic> toJson() => _$PatientdetailsSetToJson(this);
}
