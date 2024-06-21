import 'package:json_annotation/json_annotation.dart';

import 'branch.dart';

part 'branchlistmodel.g.dart';

@JsonSerializable()
class Branchlistmodel {
	bool? status;
	String? message;
	List<Branch>? branches;

	Branchlistmodel({this.status, this.message, this.branches});

	factory Branchlistmodel.fromJson(Map<String, dynamic> json) {
		return _$BranchlistmodelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$BranchlistmodelToJson(this);
}
