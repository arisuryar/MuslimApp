import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: library_prefixes
import '../../../data/models/detail_surah.dart' as detailSurah;

class AyatArab extends StatelessWidget {
  const AyatArab({
    super.key,
    required this.ayat,
  });

  final detailSurah.Verse ayat;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        ayat.text!.arab!,
        textAlign: TextAlign.end,
        style: TextStyle(fontFamily: 'Amiri', fontSize: 24.sp, fontWeight: FontWeight.bold, height: 2.5),
      ),
    );
  }
}
