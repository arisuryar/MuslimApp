import 'package:equatable/equatable.dart';

import '../../domain/entities/doa.dart';

class DoaModel extends Equatable {
  final String? arab;
  final String? indo;
  final String? judul;
  final String? source;

  const DoaModel({
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

  Doa toEntity() => Doa(
        arab: arab,
        indo: indo,
        judul: judul,
        source: source,
      );

  @override
  List<Object?> get props => [arab, indo, judul, source];
}
