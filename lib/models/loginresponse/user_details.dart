import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails {
	int? id;
	@JsonKey(name: 'last_login') 
	dynamic lastLogin;
	String? name;
	String? phone;
	String? address;
	String? mail;
	String? username;
	String? password;
	@JsonKey(name: 'password_text') 
	String? passwordText;
	int? admin;
	@JsonKey(name: 'is_admin') 
	bool? isAdmin;
	@JsonKey(name: 'is_active') 
	bool? isActive;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	@JsonKey(name: 'updated_at') 
	DateTime? updatedAt;
	dynamic branch;

	UserDetails({
		this.id, 
		this.lastLogin, 
		this.name, 
		this.phone, 
		this.address, 
		this.mail, 
		this.username, 
		this.password, 
		this.passwordText, 
		this.admin, 
		this.isAdmin, 
		this.isActive, 
		this.createdAt, 
		this.updatedAt, 
		this.branch, 
	});

	factory UserDetails.fromJson(Map<String, dynamic> json) {
		return _$UserDetailsFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
