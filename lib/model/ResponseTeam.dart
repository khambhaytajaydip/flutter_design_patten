import 'dart:convert';

/// Created by JAI
class ResponseTeam {
  List<Data> data;

  ResponseTeam({this.data});

  ResponseTeam.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String resource;
  int id;
  String name;
  String code;
  String imagePath;
  int countryId;
  bool nationalTeam;
  String updatedAt;

  Data(
      {this.resource,
        this.id,
        this.name,
        this.code,
        this.imagePath,
        this.countryId,
        this.nationalTeam,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    id = json['id'];
    name = json['name'];
    code = json['code'];
    imagePath = json['image_path'];
    countryId = json['country_id'];
    nationalTeam = json['national_team'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['image_path'] = this.imagePath;
    data['country_id'] = this.countryId;
    data['national_team'] = this.nationalTeam;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}