import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/app_text_arab.dart';
import '../../../widgets/app_text_en.dart';
import '../../../widgets/app_text_id.dart';

// ignore: library_prefixes
import '../../../domain/entities/detail_surah.dart' as detailSurah;

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
          TextArab(text: ayat.text.arab),
          10.verticalSpace,
          // Ayat Transliteration - Widgets
          TextEn(text: ayat.text.transliteration.en),
          15.verticalSpace,
          // Ayat Translation Indonesia - Widgets
          TextId(text: ayat.translation.id),
        ],
      ),
    );
  }
}
