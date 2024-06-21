import 'package:json_annotation/json_annotation.dart';

import 'user_details.dart';

part 'loginresponse.g.dart';

@JsonSerializable()
class Loginresponse {
  bool? status;
  String? message;
  String? token;
  @JsonKey(name: 'is_superuser')
  bool? isSuperuser;
  @JsonKey(name: 'user_details')
  UserDetails? userDetails;

  Loginresponse({
    this.status,
    this.message,
    this.token,
    this.isSuperuser,
    this.userDetails,
  });

  factory Loginresponse.fromJson(Map<String, dynamic> json) {
    return _$LoginresponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginresponseToJson(this);
}
