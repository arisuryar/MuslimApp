class HaditsModel {
  final String? name;
  final String? slug;
  final int? total;

  HaditsModel({
    this.name,
    this.slug,
    this.total,
  });

  factory HaditsModel.fromJson(Map<String, dynamic> json) => HaditsModel(
        name: json["name"],
        slug: json["slug"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "total": total,
      };
}
