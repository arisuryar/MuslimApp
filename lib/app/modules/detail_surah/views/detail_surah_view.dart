import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
// ignore: library_prefixes
import 'package:muslim_app/app/data/models/detail_surah.dart' as detailSurah;

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  const DetailSurahView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.arguments['name']),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.status == '') {
          return const Center(child: SizedBox());
        }
        if (controller.status == 'loading') {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.status != 'success') {
          return const Center(child: Text('Terjadi Kesalahan'));
        }
        final surah = controller.detailSurah;
        return Padding(
          padding: REdgeInsets.fromLTRB(8, 5, 8, 0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                    radius: 15,
                    titlePadding: REdgeInsets.only(top: 15),
                    title: 'Tafsir Surah ${surah.name!.transliteration!.id}',
                    titleStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                    content: Text(
                      surah.tafsir!.id!,
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
                            surah.number!.toString(),
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
                              surah.name!.transliteration!.id!,
                              style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              surah.name!.translation!.id!,
                              style: TextStyle(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${surah.revelation!.id!} | ${surah.numberOfVerses} Ayat',
                              style: TextStyle(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              15.verticalSpace,
              Expanded(
                child: ListView.builder(
                  itemCount: surah.verses!.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    detailSurah.Verse ayat = surah.verses![index];
                    return Padding(
                      padding: REdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Container(
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
                                    ayat.number!.inSurah.toString(),
                                    style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    debugPrint('Open Dialog, Tafsir Ayat');
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
                          ),
                          15.verticalSpace,
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 3),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    ayat.text!.arab!,
                                    textAlign: TextAlign.end,
                                    style:
                                        TextStyle(fontFamily: 'Amiri', fontSize: 24.sp, fontWeight: FontWeight.bold, height: 2.5),
                                  ),
                                ),
                                10.verticalSpace,
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    ayat.text!.transliteration!.en!,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.teal),
                                  ),
                                ),
                                15.verticalSpace,
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    ayat.translation!.id!,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
