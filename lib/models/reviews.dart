class Review {
  final int? id;
  final String? contents;
  final int? idUser;
  final int? idProduct;
  final int? ratting;
  final String? createdAts;
  final String? pictureReview;
  final int? likeCount;

  Review({
    this.id,
    this.contents,
    this.idUser,
    this.idProduct,
    this.ratting,
    this.createdAts,
    this.pictureReview,
    this.likeCount,
  });

  Review.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        contents = json['contents'] as String?,
        idUser = json['idUser'] as int?,
        idProduct = json['idProduct'] as int?,
        ratting = json['ratting'] as int?,
        createdAts = json['createdAts'] as String?,
        pictureReview = json['pictureReview'] as String?,
        likeCount = json['likeCount'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'contents' : contents,
    'idUser' : idUser,
    'idProduct' : idProduct,
    'ratting' : ratting,
    'createdAts' : createdAts,
    'pictureReview' : pictureReview,
    'likeCount' : likeCount,
  };
}