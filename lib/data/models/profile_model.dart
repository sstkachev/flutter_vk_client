class UserInfoList {
  List<User>? response;

  UserInfoList({this.response});

  UserInfoList.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <User>[];
      json['response'].forEach((v) {
        response!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? bdate;
  String? firstName;
  String? lastName;
  bool? canAccessClosed;
  bool? isClosed;
  String? photo;
  Country? country;
  City? city;

  User(
      {this.id,
        this.bdate,
        this.firstName,
        this.lastName,
        this.canAccessClosed,
        this.isClosed,
        this.photo,
        this.country,
        this.city});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bdate = json['bdate'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    canAccessClosed = json['can_access_closed'];
    isClosed = json['is_closed'];
    photo = json['photo_max_orig'];
    city = City.fromJson(json['city']);
    country = Country.fromJson(json['country']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bdate'] = this.bdate;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['can_access_closed'] = this.canAccessClosed;
    data['is_closed'] = this.isClosed;
    data['photo_max_orig'] = this.photo;
    return data;
  }
}

class City {
  int? id;
  String? title;

  City({
    this.id,
    this.title,
  });

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}

class Country {
  int? id;
  String? title;

  Country({
    this.id,
    this.title,
  });

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}
