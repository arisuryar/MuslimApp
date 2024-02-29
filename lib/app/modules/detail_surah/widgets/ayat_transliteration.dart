import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: library_prefixes
import '../../../data/models/detail_surah.dart' as detailSurah;

class AyatTransliteration extends StatelessWidget {
  const AyatTransliteration({
    super.key,
    required this.ayat,
  });

  final detailSurah.Verse ayat;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        ayat.text!.transliteration!.en!,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 12.sp, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500, color: Colors.teal),
      ),
    );
  }
}
