import 'dart:convert';
import 'package:intl/intl.dart';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? path;
  String? createdAt;
  String? phone_number;
  String? createdBy;
  DateTime? updatedAt;
  String? gender;
  String? identity_number;


  UserModel({
    this.id,
    this.name,
    this.email,
    this.path,
    this.createdAt,
    this.phone_number,
    this.createdBy,
    this.gender,
    this.identity_number,
    this.updatedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    createdAt = DateFormat('yyyy-MM-dd').format(DateTime.parse(json["created_at"]));
    path = json["path"];
    id = json["id"];
    phone_number = json["phone_number"];
    identity_number = json["identity_number"].toString();

    createdBy = json["created_by"];
    if (json["updated_at"] != null) {
      updatedAt = DateTime.parse(json["updated_at"]);
    }
    gender = json["gender_id"];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["created_at"] = createdAt;
    _data["path"] = path;
    _data["id"] = id;
    _data["phone_number"] = phone_number;
    _data["identity_number"] = identity_number;

    _data["created_by"] = createdBy;
   if (updatedAt != null) {
      _data["updated_at"] = updatedAt?.toIso8601String();
    }
    _data["gender_id"] =gender;
    return _data;
  }
}
