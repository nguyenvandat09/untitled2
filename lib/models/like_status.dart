
class LikeStatus {
  final int id;
  final int idReview;
  final int statusLike;

  LikeStatus({

    required this.id,
    required this.idReview,
    required this.statusLike,
  });

  factory LikeStatus.fromJson(Map<String, dynamic> json) {
    return LikeStatus(
      id: json['id'] ?? '',
      idReview: json['idReview'] ?? '',
      statusLike: json['statusLike'] ?? '',
    );
  }

}