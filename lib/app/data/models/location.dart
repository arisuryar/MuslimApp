class LocationModel {
  final String? id;
  final String? name;

  LocationModel({
    this.id,
    this.name,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
