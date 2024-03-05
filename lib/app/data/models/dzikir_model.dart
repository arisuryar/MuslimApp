import 'package:equatable/equatable.dart';

import '../../domain/entities/dzikir.dart';

class DzikirModel extends Equatable {
  final String? arab;
  final String? indo;
  final String? type;
  final String? ulang;

  const DzikirModel({
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

  Dzikir toEntity() => Dzikir(
        arab: arab,
        indo: indo,
        type: type,
        ulang: ulang,
      );

  @override
  List<Object?> get props => [arab, indo, type, ulang];
}
