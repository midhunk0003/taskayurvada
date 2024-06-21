import 'package:json_annotation/json_annotation.dart';

import 'treatment.dart';

part 'tretmentlistmodel.g.dart';

@JsonSerializable()
class Tretmentlistmodel {
	bool? status;
	String? message;
	List<Treatment>? treatments;

	Tretmentlistmodel({this.status, this.message, this.treatments});

	factory Tretmentlistmodel.fromJson(Map<String, dynamic> json) {
		return _$TretmentlistmodelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$TretmentlistmodelToJson(this);
}
