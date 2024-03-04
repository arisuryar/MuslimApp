import 'package:equatable/equatable.dart';

class Hadits extends Equatable {
  final String name;
  final String slug;
  final int total;

  const Hadits({
    required this.name,
    required this.slug,
    required this.total,
  });

  @override
  List<Object?> get props => [name, slug, total];
}
