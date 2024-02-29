import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/surah.dart';
import 'package:muslim_app/app/routes/app_pages.dart';

import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  @override
  final controller = Get.put(SurahController());
  SurahView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        return Column(
          children: [
            Padding(
              padding: REdgeInsets.fromLTRB(8, 5, 8, 5),
              child: TextField(
                onChanged: (value) => controller.filteredSurah(value),
                cursorColor: Colors.teal,
                decoration: InputDecoration(
                  hintText: 'Cari Surah',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5).w, borderSide: BorderSide.none),
                  isDense: true,
                  fillColor: Colors.teal.withOpacity(0.1),
                  filled: true,
                  contentPadding: REdgeInsets.fromLTRB(20, 18, 0, 18),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.filteredAllSurah.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  SurahModel surah = controller.filteredAllSurah[index];
                  return ListTile(
                    onTap: () => Get.toNamed(Routes.DETAIL_SURAH,
                        arguments: {'id': surah.number.toString(), 'name': surah.name!.transliteration!.id}),
                    leading: CircleAvatar(
                        backgroundColor: Colors.teal[300],
                        child: Text(
                          surah.number.toString(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
                    title: Text(
                      surah.name!.transliteration!.id!,
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      '${surah.numberOfVerses} Ayat | ${surah.revelation!.id!}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      surah.name!.short!,
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.teal, fontFamily: 'Amiri'),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
