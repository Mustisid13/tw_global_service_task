class PixabayImagesResponseModel {
  int? total;
  int? totalHits;
  List<ImagesData>? hits;

  PixabayImagesResponseModel({this.total, this.totalHits, this.hits});

  PixabayImagesResponseModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalHits = json['totalHits'];
    if (json['hits'] != null) {
      hits = <ImagesData>[];
      json['hits'].forEach((v) {
        hits!.add(ImagesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['totalHits'] = totalHits;
    if (hits != null) {
      data['hits'] = hits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImagesData {
  int? id;
  String? pageURL;
  String? type;
  String? tags;
  String? previewURL;
  int? previewWidth;
  int? previewHeight;
  String? webformatURL;
  int? webformatWidth;
  int? webformatHeight;
  String? largeImageURL;
  String? fullHDURL;
  String? imageURL;
  int? imageWidth;
  int? imageHeight;
  int? imageSize;
  int? views;
  int? downloads;
  int? likes;
  int? comments;
  int? userId;
  String? user;
  String? userImageURL;

  ImagesData(
      {this.id,
      this.pageURL,
      this.type,
      this.tags,
      this.previewURL,
      this.previewWidth,
      this.previewHeight,
      this.webformatURL,
      this.webformatWidth,
      this.webformatHeight,
      this.largeImageURL,
      this.fullHDURL,
      this.imageURL,
      this.imageWidth,
      this.imageHeight,
      this.imageSize,
      this.views,
      this.downloads,
      this.likes,
      this.comments,
      this.userId,
      this.user,
      this.userImageURL});

  ImagesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageURL = json['pageURL'];
    type = json['type'];
    tags = json['tags'];
    previewURL = json['previewURL'];
    previewWidth = json['previewWidth'];
    previewHeight = json['previewHeight'];
    webformatURL = json['webformatURL'];
    webformatWidth = json['webformatWidth'];
    webformatHeight = json['webformatHeight'];
    largeImageURL = json['largeImageURL'];
    fullHDURL = json['largeImageURL'];
    imageURL = json['imageURL'];
    imageWidth = json['imageWidth'];
    imageHeight = json['imageHeight'];
    imageSize = json['imageSize'];
    views = json['views'];
    downloads = json['downloads'];
    likes = json['likes'];
    comments = json['comments'];
    userId = json['user_id'];
    user = json['user'];
    userImageURL = json['userImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pageURL'] = pageURL;
    data['type'] = type;
    data['tags'] = tags;
    data['previewURL'] = previewURL;
    data['previewWidth'] = previewWidth;
    data['previewHeight'] = previewHeight;
    data['webformatURL'] = webformatURL;
    data['webformatWidth'] = webformatWidth;
    data['webformatHeight'] = webformatHeight;
    data['largeImageURL'] = largeImageURL;
    data['fullHDURL'] = fullHDURL;
    data['imageURL'] = imageURL;
    data['imageWidth'] = imageWidth;
    data['imageHeight'] = imageHeight;
    data['imageSize'] = imageSize;
    data['views'] = views;
    data['downloads'] = downloads;
    data['likes'] = likes;
    data['comments'] = comments;
    data['user_id'] = userId;
    data['user'] = user;
    data['userImageURL'] = userImageURL;
    return data;
  }
}
