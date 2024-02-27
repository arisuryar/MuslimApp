class DoaModel {
  final String? arab;
  final String? indo;
  final String? judul;
  final String? source;

  DoaModel({
    this.arab,
    this.indo,
    this.judul,
    this.source,
  });

  factory DoaModel.fromJson(Map<String, dynamic> json) => DoaModel(
        arab: json["arab"],
        indo: json["indo"],
        judul: json["judul"],
        source: json["source"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "indo": indo,
        "judul": judul,
        "source": source,
      };
}
