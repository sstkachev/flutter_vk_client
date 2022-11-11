class StartPagePhotosDto {
  Response? response;

  StartPagePhotosDto({this.response});

  StartPagePhotosDto.fromJson(Map<String, dynamic> json) {
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }
}

class Response {
  int? count;
  List<StartPagePhoto>? items;

  Response({this.count, this.items});

  Response.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['items'] != null) {
      items = <StartPagePhoto>[];
      json['items'].forEach((v) {
        items!.add(StartPagePhoto.fromJson(v));
      });
    }
  }
}

class StartPagePhoto {
  int? albumId;
  int? date;
  int? id;
  int? ownerId;
  int? canComment;
  int? postId;
  List<Sizes>? sizes;
  String? text;
  bool? hasTags;
  Likes? likes;
  Comments? comments;
  Comments? reposts;
  Comments? tags;

  StartPagePhoto(
      {this.albumId,
      this.date,
      this.id,
      this.ownerId,
      this.canComment,
      this.postId,
      this.sizes,
      this.text,
      this.hasTags,
      this.likes,
      this.comments,
      this.reposts,
      this.tags});

  StartPagePhoto.fromJson(Map<String, dynamic> json) {
    albumId = json['album_id'];
    date = json['date'];
    id = json['id'];
    ownerId = json['owner_id'];
    canComment = json['can_comment'];
    postId = json['post_id'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(Sizes.fromJson(v));
      });
    }
    text = json['text'];
    hasTags = json['has_tags'];
    likes = json['likes'] != null ? Likes.fromJson(json['likes']) : null;
    comments =
        json['comments'] != null ? Comments.fromJson(json['comments']) : null;
    reposts =
        json['reposts'] != null ? Comments.fromJson(json['reposts']) : null;
    tags = json['tags'] != null ? Comments.fromJson(json['tags']) : null;
  }
}

class Sizes {
  int? height;
  String? url;
  String? type;
  int? width;

  Sizes({this.height, this.url, this.type, this.width});

  Sizes.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    type = json['type'];
    width = json['width'];
  }
}

class Likes {
  int? count;
  int? userLikes;

  Likes({this.count, this.userLikes});

  Likes.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    userLikes = json['user_likes'];
  }
}

class Comments {
  int? count;

  Comments({this.count});

  Comments.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }
}
