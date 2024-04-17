class PixabayModel {
  final int id;
  final String tags;
  final String previewURL;
  final String webformatURL;
  final String largeImageURL;
  final int views;
  final int likes;
  final int comments;
  final String user;
  final String userImageURL;

  PixabayModel({
    required this.id,
    required this.tags,
    required this.previewURL,
    required this.webformatURL,
    required this.largeImageURL,
    required this.views,
    required this.likes,
    required this.comments,
    required this.user,
    required this.userImageURL,
  });

  factory PixabayModel.fromJson(Map<String, dynamic> json) {
    return PixabayModel(
      id: json['id'],
      tags: json['tags'],
      previewURL: json['previewURL'],
      webformatURL: json['webformatURL'],
      largeImageURL: json['largeImageURL'],
      views: json['views'],
      likes: json['likes'],
      comments: json['comments'],
      user: json['user'],
      userImageURL: json['userImageURL'],
    );
  }
}