class Category {
  final int? id;
  final String? name;
  final String? iconurl;

  Category({
    this.id,
    this.name,
    this.iconurl
  });
  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['nameCategory'] as String?,
        iconurl = json['picture'] as String?;


  Map<String, dynamic> toJson() => {
    'id' : id,
    'nameCategory' : name,
    'picture' : iconurl,

  };
}

