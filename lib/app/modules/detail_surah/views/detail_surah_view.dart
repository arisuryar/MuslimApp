import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/common/state_enum.dart';
import 'detail_surah_content.dart';
import 'detail_surah_header.dart';

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
        final state = controller.detailSurahState.value;
        if (state == RequestState.initial) {
          return const Center(child: SizedBox());
        }
        if (state == RequestState.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state != RequestState.success) {
          return const Center(child: Text('Terjadi Kesalahan'));
        }
        final surah = controller.detailSurah;
        return Padding(
          padding: REdgeInsets.fromLTRB(8, 5, 8, 0),
          child: Column(
            children: [
              DetailSurahHeader(surah: surah),
              15.verticalSpace,
              DetailSurahContent(surah: surah),
            ],
          ),
        );
      }),
    );
  }
}
