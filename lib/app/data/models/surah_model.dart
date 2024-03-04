import 'package:equatable/equatable.dart';
import '../../domain/entities/surah.dart';

class SurahModel extends Equatable {
  final int number;
  final int sequence;
  final int numberOfVerses;
  final NameModel name;
  final RevelationModel revelation;
  final TafsirModel tafsir;

  const SurahModel({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: NameModel.fromJson(json["name"]),
        revelation: RevelationModel.fromJson(json["revelation"]),
        tafsir: TafsirModel.fromJson(json["tafsir"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name.toJson(),
        "revelation": revelation.toJson(),
        "tafsir": tafsir.toJson(),
      };

  Surah toEntity() => Surah(
        number: number,
        sequence: sequence,
        numberOfVerses: numberOfVerses,
        name: name.toEntity(),
        revelation: revelation.toEntity(),
        tafsir: tafsir.toEntity(),
      );

  @override
  List<Object?> get props => [number, sequence, numberOfVerses, name, revelation, tafsir];
}

class NameModel extends Equatable {
  final String short;
  final String long;
  final TranslationModel transliteration;
  final TranslationModel translation;

  const NameModel({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });

  factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
        short: json["short"],
        long: json["long"],
        transliteration: TranslationModel.fromJson(json["transliteration"]),
        translation: TranslationModel.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
        "transliteration": transliteration.toJson(),
        "translation": translation.toJson(),
      };

  Name toEntity() => Name(
        short: short,
        long: long,
        transliteration: transliteration.toEntity(),
        translation: translation.toEntity(),
      );

  @override
  List<Object?> get props => [short, long, transliteration, translation];
}

class TranslationModel extends Equatable {
  final String en;
  final String id;

  const TranslationModel({
    required this.en,
    required this.id,
  });

  factory TranslationModel.fromJson(Map<String, dynamic> json) => TranslationModel(
        en: json["en"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "id": id,
      };

  Translation toEntity() => Translation(
        en: en,
        id: id,
      );

  @override
  List<Object?> get props => [en, id];
}

class RevelationModel extends Equatable {
  final String arab;
  final String en;
  final String id;

  const RevelationModel({
    required this.arab,
    required this.en,
    required this.id,
  });

  factory RevelationModel.fromJson(Map<String, dynamic> json) => RevelationModel(
        arab: json["arab"],
        en: json["en"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "en": en,
        "id": id,
      };

  Revelation toEntity() => Revelation(
        arab: arab,
        en: en,
        id: id,
      );

  @override
  List<Object?> get props => [arab, en, id];
}

class TafsirModel extends Equatable {
  final String id;

  const TafsirModel({
    required this.id,
  });

  factory TafsirModel.fromJson(Map<String, dynamic> json) => TafsirModel(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };

  Tafsir toEntity() => Tafsir(
        id: id,
      );

  @override
  List<Object?> get props => [id];
}
