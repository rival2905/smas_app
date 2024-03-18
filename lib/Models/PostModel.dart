import 'dart:convert';
import 'package:intl/intl.dart';

class PostPageModel {
  String? title;
  String? content;
  String? createdAt;
  String? path;
  int? id;
  String? slug;
  String? createdBy;
  DateTime? updatedAt;
  User? user;
  String? category;

  PostPageModel({
    this.title,
    this.content,
    this.createdAt,
    this.path,
    this.id,
    this.slug,
    this.createdBy,
    this.user,
    this.category,
    this.updatedAt,
  });

  PostPageModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    content = json["content"];
    createdAt = DateFormat('yyyy-MM-dd').format(DateTime.parse(json["created_at"]));
    path = json["path"];
    id = json["id"];
    slug = json["slug"];
    createdBy = json["created_by"];
    if (json["updated_at"] != null) {
      updatedAt = DateTime.parse(json["updated_at"]);
    }
    category = json["category_id"];
    if (json["user"] != null) {
      user = User.fromJson(json["user"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["content"] = content;
    _data["created_at"] = createdAt;
    _data["path"] = path;
    _data["id"] = id;
    _data["slug"] = slug;
    _data["created_by"] = createdBy;
   if (updatedAt != null) {
      _data["updated_at"] = updatedAt?.toIso8601String();
    }
    _data["category_id"] =category;
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class User {
  int? id;
  String? name;

  User({
    this.id,
    this.name,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}