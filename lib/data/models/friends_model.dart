class FriendsDto {
  FriendsList? response;

  FriendsDto({this.response});

  FriendsDto.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new FriendsList.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class FriendsList {
  int? count;
  List<Friend>? items;

  FriendsList({this.count, this.items});

  FriendsList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['items'] != null) {
      items = <Friend>[];
      json['items'].forEach((v) {
        items!.add(new Friend.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Friend {
  int? id;
  String? bdate;
  City? city;
  City? country;
  int? relation;
  String? trackCode;
  String? photo50;
  String? firstName;
  String? lastName;
  bool? canAccessClosed;
  bool? isClosed;
  RelationPartner? relationPartner;
  String? deactivated;

  Friend(
      {this.id,
        this.bdate,
        this.city,
        this.country,
        this.relation,
        this.trackCode,
        this.photo50,
        this.firstName,
        this.lastName,
        this.canAccessClosed,
        this.isClosed,
        this.relationPartner,
        this.deactivated});

  Friend.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bdate = json['bdate'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    country =
    json['country'] != null ? new City.fromJson(json['country']) : null;
    relation = json['relation'];
    trackCode = json['track_code'];
    photo50 = json['photo_50'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    canAccessClosed = json['can_access_closed'];
    isClosed = json['is_closed'];
    relationPartner = json['relation_partner'] != null
        ? new RelationPartner.fromJson(json['relation_partner'])
        : null;
    deactivated = json['deactivated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bdate'] = this.bdate;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['relation'] = this.relation;
    data['track_code'] = this.trackCode;
    data['photo_50'] = this.photo50;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['can_access_closed'] = this.canAccessClosed;
    data['is_closed'] = this.isClosed;
    if (this.relationPartner != null) {
      data['relation_partner'] = this.relationPartner!.toJson();
    }
    data['deactivated'] = this.deactivated;
    return data;
  }
}

class City {
  int? id;
  String? title;

  City({this.id, this.title});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class RelationPartner {
  int? id;
  String? firstName;
  String? lastName;

  RelationPartner({this.id, this.firstName, this.lastName});

  RelationPartner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}