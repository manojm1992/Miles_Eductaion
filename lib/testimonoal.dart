class Testimonial {
  String? message;
  List<Data>? data;

  Testimonial({this.message, this.data});

  Testimonial.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  bool? likedByMe;
  String? firstName;
  String? lastName;
  String? description;
  String? imageUrl;
  String? videoUrl;
  Null? fullVideoUrl;
  int? likes;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? modifiedBy;
  bool? watched;

  Data(
      {this.id,
        this.likedByMe,
        this.firstName,
        this.lastName,
        this.description,
        this.imageUrl,
        this.videoUrl,
        this.fullVideoUrl,
        this.likes,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.modifiedBy,
        this.watched});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    likedByMe = json['liked_by_me'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    description = json['description'];
    imageUrl = json['image_url'];
    videoUrl = json['video_url'];
    fullVideoUrl = json['full_video_url'];
    likes = json['likes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    watched = json['watched'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['liked_by_me'] = this.likedByMe;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['video_url'] = this.videoUrl;
    data['full_video_url'] = this.fullVideoUrl;
    data['likes'] = this.likes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['watched'] = this.watched;
    return data;
  }
}
