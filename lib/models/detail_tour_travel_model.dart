
class DetailModel {
  Meta? meta;
  List<Null>? pagination;
  Data? data;

  DetailModel({this.meta, this.pagination, this.data});

  DetailModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    // if (json['pagination'] != null) {
    //   pagination = <Null>[];
    //   json['pagination'].forEach((v) {
    //     pagination!.add(new Null.fromJson(v));
    //   });
    // }
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    // if (this.pagination != null) {
    //   data['pagination'] = this.pagination!.map((v) => v.toJson()).toList();
    // }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Meta {
  int? code;
  String? status;
  String? message;
  bool? isPaginated;

  Meta({this.code, this.status, this.message, this.isPaginated});

  Meta.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    isPaginated = json['is_paginated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    data['is_paginated'] = this.isPaginated;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  int? rating;
  double? lat;
  double? long;
  String? image;
  List<Package>? package;
  List<Media>? media;
  String? createdAt;
  String? updateAt;

  Data(
      {this.id,
        this.title,
        this.description,
        this.rating,
        this.lat,
        this.long,
        this.image,
        this.package,
        this.media,
        this.createdAt,
        this.updateAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    rating = json['rating'];
    lat = json['lat'];
    long = json['long'];
    image = json['image'];
    if (json['package'] != null) {
      package = <Package>[];
      json['package'].forEach((v) {
        package!.add(new Package.fromJson(v));
      });
    }
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['image'] = this.image;
    if (this.package != null) {
      data['package'] = this.package!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    return data;
  }
}

class Package {
  int? id;
  int? idTour;
  String? title;
  String? description;
  String? image;
  int? harga;
  String? shortTitle;
  String? shortTgl;
  String? shortPlace;
  String? createdAt;
  String? updateAt;

  Package(
      {this.id,
        this.idTour,
        this.title,
        this.description,
        this.image,
        this.harga,
        this.shortTitle,
        this.shortTgl,
        this.shortPlace,
        this.createdAt,
        this.updateAt});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idTour = json['id_tour'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    harga = json['harga'];
    shortTitle = json['short_title'];
    shortTgl = json['short_tgl'];
    shortPlace = json['short_place'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_tour'] = this.idTour;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['harga'] = this.harga;
    data['short_title'] = this.shortTitle;
    data['short_tgl'] = this.shortTgl;
    data['short_place'] = this.shortPlace;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    return data;
  }
}

class Media {
  int? id;
  int? idTour;
  String? image;
  String? createdAt;
  String? updateAt;

  Media({this.id, this.idTour, this.image, this.createdAt, this.updateAt});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idTour = json['id_tour'];
    image = json['image'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_tour'] = this.idTour;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    return data;
  }
}
