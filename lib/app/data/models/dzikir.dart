class DzikirModel {
  final String? arab;
  final String? indo;
  final String? type;
  final String? ulang;

  DzikirModel({
    this.arab,
    this.indo,
    this.type,
    this.ulang,
  });

  factory DzikirModel.fromJson(Map<String, dynamic> json) => DzikirModel(
        arab: json["arab"],
        indo: json["indo"],
        type: json["type"],
        ulang: json["ulang"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "indo": indo,
        "type": type,
        "ulang": ulang,
      };
}
