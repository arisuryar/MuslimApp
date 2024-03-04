import 'package:equatable/equatable.dart';

class DetailSurah extends Equatable {
  final int? number;
  final int? sequence;
  final int? numberOfVerses;
  final Name? name;
  final Revelation? revelation;
  final DetailSurahTafsir? tafsir;
  final dynamic preBismillah;
  final List<Verse>? verses;

  const DetailSurah({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.tafsir,
    this.preBismillah,
    this.verses,
  });

  @override
  List<Object?> get props => [number, sequence, numberOfVerses, name, revelation, tafsir, preBismillah, verses];
}

class Name extends Equatable {
  final String short;
  final String long;
  final Translation transliteration;
  final Translation translation;

  const Name({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });

  @override
  List<Object?> get props => [short, long, transliteration, translation];
}

class Translation extends Equatable {
  final String en;
  final String id;

  const Translation({
    required this.en,
    required this.id,
  });

  @override
  List<Object?> get props => [en, id];
}

class Revelation extends Equatable {
  final String arab;
  final String en;
  final String id;

  const Revelation({
    required this.arab,
    required this.en,
    required this.id,
  });

  @override
  List<Object?> get props => [arab, en, id];
}

class DetailSurahTafsir extends Equatable {
  final String id;

  const DetailSurahTafsir({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class Verse extends Equatable {
  final Number number;
  final Meta meta;
  final Text text;
  final Translation translation;
  final Audio audio;
  final VerseTafsir tafsir;

  const Verse({
    required this.number,
    required this.meta,
    required this.text,
    required this.translation,
    required this.audio,
    required this.tafsir,
  });

  @override
  List<Object?> get props => [number, meta, text, translation, audio, tafsir];
}

class Audio extends Equatable {
  final String primary;
  final List<String> secondary;

  const Audio({
    required this.primary,
    required this.secondary,
  });

  @override
  List<Object?> get props => [primary, secondary];
}

class Meta extends Equatable {
  final int juz;
  final int page;
  final int manzil;
  final int ruku;
  final int hizbQuarter;
  final Sajda sajda;

  const Meta({
    required this.juz,
    required this.page,
    required this.manzil,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  @override
  List<Object?> get props => [juz, page, manzil, ruku, hizbQuarter, sajda];
}

class Sajda extends Equatable {
  final bool recommended;
  final bool obligatory;

  const Sajda({
    required this.recommended,
    required this.obligatory,
  });

  @override
  List<Object?> get props => [recommended, obligatory];
}

class Number extends Equatable {
  final int inQuran;
  final int inSurah;

  const Number({
    required this.inQuran,
    required this.inSurah,
  });

  @override
  List<Object?> get props => [inQuran, inSurah];
}

class VerseTafsir extends Equatable {
  final Id id;

  const VerseTafsir({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class Id extends Equatable {
  final String short;
  final String long;

  const Id({
    required this.short,
    required this.long,
  });

  @override
  List<Object?> get props => [short, long];
}

class Text extends Equatable {
  final String arab;
  final Transliteration transliteration;

  const Text({
    required this.arab,
    required this.transliteration,
  });

  @override
  List<Object?> get props => [arab, transliteration];
}

class Transliteration extends Equatable {
  final String en;

  const Transliteration({
    required this.en,
  });

  @override
  List<Object?> get props => [en];
}
