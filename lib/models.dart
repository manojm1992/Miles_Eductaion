class Home_Page_Model {
  List<Data>? data;

  Home_Page_Model({this.data});

  Home_Page_Model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? blockType;
  String? name;
  String? heading;
  int? position;
  int? count;
  bool? active;
  String? createdAt;
  String? updatedAt;
  String? vertical;
  Null? createdBy;
  String? modifiedBy;
  List<Posts>? posts;

  Data(
      {this.id,
        this.blockType,
        this.name,
        this.heading,
        this.position,
        this.count,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.vertical,
        this.createdBy,
        this.modifiedBy,
        this.posts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    blockType = json['block_type'];
    name = json['name'];
    heading = json['heading'];
    position = json['position'];
    count = json['count'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    vertical = json['vertical'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['block_type'] = this.blockType;
    data['name'] = this.name;
    data['heading'] = this.heading;
    data['position'] = this.position;
    data['count'] = this.count;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['vertical'] = this.vertical;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String? id;
  List<Files>? files;
  bool? likedByMe;
  String? title;
  String? postType;
  String? description;
  String? metadata;
  String? fullVideoUrl;
  String? blogUrl;
  bool? active;
  bool? featured;
  int? priority;
  int? likes;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? layout;
  Null? persona;
  String? modifiedBy;

  Posts(
      {this.id,
        this.files,
        this.likedByMe,
        this.title,
        this.postType,
        this.description,
        this.metadata,
        this.fullVideoUrl,
        this.blogUrl,
        this.active,
        this.featured,
        this.priority,
        this.likes,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.layout,
        this.persona,
        this.modifiedBy});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(new Files.fromJson(v));
      });
    }
    likedByMe = json['liked_by_me'];
    title = json['title'];
    postType = json['post_type'];
    description = json['description'];
    metadata = json['metadata'];
    fullVideoUrl = json['full_video_url'];
    blogUrl = json['blog_url'];
    active = json['active'];
    featured = json['featured'];
    priority = json['priority'];
    likes = json['likes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    layout = json['layout'];
    persona = json['persona'];
    modifiedBy = json['modified_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    data['liked_by_me'] = this.likedByMe;
    data['title'] = this.title;
    data['post_type'] = this.postType;
    data['description'] = this.description;
    data['metadata'] = this.metadata;
    data['full_video_url'] = this.fullVideoUrl;
    data['blog_url'] = this.blogUrl;
    data['active'] = this.active;
    data['featured'] = this.featured;
    data['priority'] = this.priority;
    data['likes'] = this.likes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['layout'] = this.layout;
    data['persona'] = this.persona;
    data['modified_by'] = this.modifiedBy;
    return data;
  }
}

class Files {
  String? id;
  String? mediaType;
  String? videoUrl;
  String? thumbnail;
  String? imagePath;
  int? mediaOrder;
  Null? ratio;
  bool? active;
  String? post;

  Files(
      {this.id,
        this.mediaType,
        this.videoUrl,
        this.thumbnail,
        this.imagePath,
        this.mediaOrder,
        this.ratio,
        this.active,
        this.post});

  Files.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaType = json['media_type'];
    videoUrl = json['video_url'];
    thumbnail = json['thumbnail'];
    imagePath = json['image_path'];
    mediaOrder = json['media_order'];
    ratio = json['ratio'];
    active = json['active'];
    post = json['post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['media_type'] = this.mediaType;
    data['video_url'] = this.videoUrl;
    data['thumbnail'] = this.thumbnail;
    data['image_path'] = this.imagePath;
    data['media_order'] = this.mediaOrder;
    data['ratio'] = this.ratio;
    data['active'] = this.active;
    data['post'] = this.post;
    return data;
  }
}
