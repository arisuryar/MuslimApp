import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// ignore: library_prefixes
import '../../../data/models/detail_surah.dart' as detailSurah;

class AyatHeader extends StatelessWidget {
  const AyatHeader({
    super.key,
    required this.ayat,
  });

  final detailSurah.Verse ayat;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: REdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5).w,
        color: Colors.teal,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
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
              '${ayat.number!.inSurah}',
              style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(Icons.bookmark_add_outlined, size: 28, color: Colors.black45),
              ),
              15.horizontalSpace,
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                    radius: 15,
                    titlePadding: REdgeInsets.only(top: 15),
                    title: 'Tafsir Ayat ${ayat.number!.inSurah}',
                    titleStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                    content: Text(
                      ayat.tafsir!.id!.short!,
                      textAlign: TextAlign.justify,
                    ),
                    contentPadding: REdgeInsets.fromLTRB(15, 15, 15, 0),
                  );
                },
                child: const Icon(Icons.info_outline, size: 28, color: Colors.black45),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
