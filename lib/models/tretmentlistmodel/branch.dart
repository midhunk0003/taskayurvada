import 'package:json_annotation/json_annotation.dart';

part 'branch.g.dart';

@JsonSerializable()
class Branch {
	int? id;
	String? name;
	@JsonKey(name: 'patients_count') 
	int? patientsCount;
	String? location;
	String? phone;
	String? mail;
	String? address;
	String? gst;
	@JsonKey(name: 'is_active') 
	bool? isActive;

	Branch({
		this.id, 
		this.name, 
		this.patientsCount, 
		this.location, 
		this.phone, 
		this.mail, 
		this.address, 
		this.gst, 
		this.isActive, 
	});

	factory Branch.fromJson(Map<String, dynamic> json) {
		return _$BranchFromJson(json);
	}

	Map<String, dynamic> toJson() => _$BranchToJson(this);
}
