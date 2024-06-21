import 'package:json_annotation/json_annotation.dart';

import 'branch.dart';

part 'treatment.g.dart';

@JsonSerializable()
class Treatment {
	int? id;
	List<Branch>? branches;
	String? name;
	String? duration;
	String? price;
	@JsonKey(name: 'is_active') 
	bool? isActive;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	@JsonKey(name: 'updated_at') 
	DateTime? updatedAt;

	Treatment({
		this.id, 
		this.branches, 
		this.name, 
		this.duration, 
		this.price, 
		this.isActive, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Treatment.fromJson(Map<String, dynamic> json) {
		return _$TreatmentFromJson(json);
	}

	Map<String, dynamic> toJson() => _$TreatmentToJson(this);
}
