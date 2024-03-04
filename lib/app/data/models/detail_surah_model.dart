import 'package:equatable/equatable.dart';
import '../../domain/entities/detail_surah.dart';

class DetailSurahModel extends Equatable {
  final int number;
  final int sequence;
  final int numberOfVerses;
  final NameModel name;
  final RevelationModel revelation;
  final DetailSurahModelTafsirModel tafsir;
  final dynamic preBismillah;
  final List<VerseModel> verses;

  const DetailSurahModel({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
    required this.preBismillah,
    required this.verses,
  });

  factory DetailSurahModel.fromJson(Map<String, dynamic> json) => DetailSurahModel(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: NameModel.fromJson(json["name"]),
        revelation: RevelationModel.fromJson(json["revelation"]),
        tafsir: DetailSurahModelTafsirModel.fromJson(json["tafsir"]),
        preBismillah: json["preBismillah"],
        verses: List<VerseModel>.from(json["verses"].map((x) => VerseModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name.toJson(),
        "revelation": revelation.toJson(),
        "tafsir": tafsir.toJson(),
        "preBismillah": preBismillah,
        "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
      };

  DetailSurah toEntity() => DetailSurah(
        number: number,
        sequence: sequence,
        numberOfVerses: numberOfVerses,
        name: name.toEntity(),
        revelation: revelation.toEntity(),
        tafsir: tafsir.toEntity(),
        preBismillah: preBismillah,
        verses: verses.map((e) => e.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [number, sequence, numberOfVerses, name, revelation, tafsir, preBismillah, verses];
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

  Translation toEntity() => Translation(en: en, id: id);

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

  Revelation toEntity() => Revelation(arab: arab, en: en, id: id);

  @override
  List<Object?> get props => [arab, en, id];
}

class DetailSurahModelTafsirModel extends Equatable {
  final String id;

  const DetailSurahModelTafsirModel({
    required this.id,
  });

  factory DetailSurahModelTafsirModel.fromJson(Map<String, dynamic> json) => DetailSurahModelTafsirModel(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };

  DetailSurahTafsir toEntity() => DetailSurahTafsir(id: id);

  @override
  List<Object?> get props => [id];
}

class VerseModel extends Equatable {
  final NumberModel number;
  final MetaModel meta;
  final TextModel text;
  final TranslationModel translation;
  final AudioModel audio;
  final VerseTafsirModel tafsir;

  const VerseModel({
    required this.number,
    required this.meta,
    required this.text,
    required this.translation,
    required this.audio,
    required this.tafsir,
  });

  factory VerseModel.fromJson(Map<String, dynamic> json) => VerseModel(
        number: NumberModel.fromJson(json["number"]),
        meta: MetaModel.fromJson(json["meta"]),
        text: TextModel.fromJson(json["text"]),
        translation: TranslationModel.fromJson(json["translation"]),
        audio: AudioModel.fromJson(json["audio"]),
        tafsir: VerseTafsirModel.fromJson(json["tafsir"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number.toJson(),
        "meta": meta.toJson(),
        "text": text.toJson(),
        "translation": translation.toJson(),
        "audio": audio.toJson(),
        "tafsir": tafsir.toJson(),
      };

  Verse toEntity() => Verse(
        number: number.toEntity(),
        meta: meta.toEntity(),
        text: text.toEntity(),
        translation: translation.toEntity(),
        audio: audio.toEntity(),
        tafsir: tafsir.toEntity(),
      );

  @override
  List<Object?> get props => [number, meta, text, translation, audio, tafsir];
}

class AudioModel extends Equatable {
  final String primary;
  final List<String> secondary;

  const AudioModel({
    required this.primary,
    required this.secondary,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
        primary: json["primary"],
        secondary: List<String>.from(json["secondary"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": List<dynamic>.from(secondary.map((x) => x)),
      };

  Audio toEntity() => Audio(primary: primary, secondary: secondary);

  @override
  List<Object?> get props => [primary, secondary];
}

class MetaModel extends Equatable {
  final int juz;
  final int page;
  final int manzil;
  final int ruku;
  final int hizbQuarter;
  final SajdaModel sajda;

  const MetaModel({
    required this.juz,
    required this.page,
    required this.manzil,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        juz: json["juz"],
        page: json["page"],
        manzil: json["manzil"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: SajdaModel.fromJson(json["sajda"]),
      );

  Map<String, dynamic> toJson() => {
        "juz": juz,
        "page": page,
        "manzil": manzil,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda.toJson(),
      };

  Meta toEntity() => Meta(
        juz: juz,
        page: page,
        manzil: manzil,
        ruku: ruku,
        hizbQuarter: hizbQuarter,
        sajda: sajda.toEntity(),
      );

  @override
  List<Object?> get props => [juz, page, manzil, ruku, hizbQuarter, sajda];
}

class SajdaModel extends Equatable {
  final bool recommended;
  final bool obligatory;

  const SajdaModel({
    required this.recommended,
    required this.obligatory,
  });

  factory SajdaModel.fromJson(Map<String, dynamic> json) => SajdaModel(
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );

  Map<String, dynamic> toJson() => {
        "recommended": recommended,
        "obligatory": obligatory,
      };

  Sajda toEntity() => Sajda(recommended: recommended, obligatory: obligatory);

  @override
  List<Object?> get props => [recommended, obligatory];
}

class NumberModel extends Equatable {
  final int inQuran;
  final int inSurah;

  const NumberModel({
    required this.inQuran,
    required this.inSurah,
  });

  factory NumberModel.fromJson(Map<String, dynamic> json) => NumberModel(
        inQuran: json["inQuran"],
        inSurah: json["inSurah"],
      );

  Map<String, dynamic> toJson() => {
        "inQuran": inQuran,
        "inSurah": inSurah,
      };

  Number toEntity() => Number(inQuran: inQuran, inSurah: inSurah);

  @override
  List<Object?> get props => [inQuran, inSurah];
}

class VerseTafsirModel extends Equatable {
  final IdModel id;

  const VerseTafsirModel({
    required this.id,
  });

  factory VerseTafsirModel.fromJson(Map<String, dynamic> json) => VerseTafsirModel(
        id: IdModel.fromJson(json["id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id.toJson(),
      };

  VerseTafsir toEntity() => VerseTafsir(id: id.toEntity());

  @override
  List<Object?> get props => [id];
}

class IdModel extends Equatable {
  final String short;
  final String long;

  const IdModel({
    required this.short,
    required this.long,
  });

  factory IdModel.fromJson(Map<String, dynamic> json) => IdModel(
        short: json["short"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
      };

  Id toEntity() => Id(short: short, long: long);

  @override
  List<Object?> get props => [short, long];
}

class TextModel extends Equatable {
  final String arab;
  final TransliterationModel transliteration;

  const TextModel({
    required this.arab,
    required this.transliteration,
  });

  factory TextModel.fromJson(Map<String, dynamic> json) => TextModel(
        arab: json["arab"],
        transliteration: TransliterationModel.fromJson(json["transliteration"]),
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "transliteration": transliteration.toJson(),
      };

  Text toEntity() => Text(arab: arab, transliteration: transliteration.toEntity());

  @override
  List<Object?> get props => [arab, transliteration];
}

class TransliterationModel extends Equatable {
  final String en;

  const TransliterationModel({
    required this.en,
  });

  factory TransliterationModel.fromJson(Map<String, dynamic> json) => TransliterationModel(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };

  Transliteration toEntity() => Transliteration(en: en);

  @override
  List<Object?> get props => [en];
}
