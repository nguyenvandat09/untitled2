class Reply {
  final int? id;
  final int? idUser;
  final int? idReview;
  final String? contents;
  final String? createdAts;

  Reply({
    this.id,
    this.contents,
    this.idUser,
    this.idReview,
    this.createdAts,

  });

  Reply.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        contents = json['contents'] as String?,
        idUser = json['idUser'] as int?,
        idReview = json['idReview'] as int?,
        createdAts = json['createdAts'] as String?;



  Map<String, dynamic> toJson() => {
    'id' : id,
    'contents' : contents,
    'idUser' : idUser,
    'idReview' : idReview,
    'createdAts':  createdAts,
  };
}
