import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// ignore: library_prefixes
import '../../../domain/entities/detail_surah.dart' as detailSurah;

class DetailSurahHeader extends StatelessWidget {
  const DetailSurahHeader({
    super.key,
    required this.surah,
  });

  final detailSurah.DetailSurah surah;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(
          radius: 15,
          titlePadding: REdgeInsets.only(top: 15),
          title: 'Tafsir Surah ${surah.name!.transliteration.id}',
          titleStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          content: Text(
            surah.tafsir!.id,
            textAlign: TextAlign.justify,
          ),
          contentPadding: REdgeInsets.fromLTRB(15, 15, 15, 0),
        );
      },
      child: Container(
        padding: REdgeInsets.fromLTRB(12, 8, 12, 12),
        height: 100,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5).w,
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade200,
              Colors.teal.shade300,
              Colors.teal.shade500,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            transform: const GradientRotation(30),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                alignment: Alignment.center,
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  surah.number.toString(),
                  style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.info_outline, color: Colors.black45, size: 28),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    surah.name!.transliteration.id,
                    style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    surah.name!.translation.id,
                    style: TextStyle(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${surah.revelation!.id} | ${surah.numberOfVerses} Ayat',
                    style: TextStyle(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
