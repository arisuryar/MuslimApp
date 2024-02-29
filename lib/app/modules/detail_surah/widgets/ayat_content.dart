import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ayat_arab.dart';
import 'ayat_translation_id.dart';
import 'ayat_transliteration.dart';
// ignore: library_prefixes
import '../../../data/models/detail_surah.dart' as detailSurah;

class AyatContent extends StatelessWidget {
  const AyatContent({
    super.key,
    required this.ayat,
  });

  final detailSurah.Verse ayat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 3),
      child: Column(
        children: [
          // Ayat Arab - Widgets
          AyatArab(ayat: ayat),
          10.verticalSpace,
          // Ayat Transliteration - Widgets
          AyatTransliteration(ayat: ayat),
          15.verticalSpace,
          // Ayat Translation Indonesia - Widgets
          AyatTranslationIndonesia(ayat: ayat),
        ],
      ),
    );
  }
}
