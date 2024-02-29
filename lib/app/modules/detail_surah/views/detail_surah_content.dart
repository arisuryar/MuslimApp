import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/ayat_content.dart';
import '../widgets/ayat_header.dart';
// ignore: library_prefixes
import '../../../data/models/detail_surah.dart' as detailSurah;

class DetailSurahContent extends StatelessWidget {
  const DetailSurahContent({
    super.key,
    required this.surah,
  });

  final detailSurah.DetailSurahModel surah;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: surah.verses!.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          detailSurah.Verse ayat = surah.verses![index];
          return Padding(
            padding: REdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                // Ayat Header - Widgets
                AyatHeader(ayat: ayat),
                15.verticalSpace,
                // Ayat Content - Widgets
                AyatContent(ayat: ayat),
              ],
            ),
          );
        },
      ),
    );
  }
}
