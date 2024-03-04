import 'package:equatable/equatable.dart';
import '../../domain/entities/hadits.dart';

class HaditsModel extends Equatable {
  final String name;
  final String slug;
  final int total;

  const HaditsModel({
    required this.name,
    required this.slug,
    required this.total,
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

  Hadits toEntity() => Hadits(
        name: name,
        slug: slug,
        total: total,
      );

  @override
  List<Object?> get props => [name, slug, total];
}
