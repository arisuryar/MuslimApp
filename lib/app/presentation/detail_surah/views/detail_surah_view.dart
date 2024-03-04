import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../common/state_enum.dart';

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
        if (state == RequestState.error) {
          return Center(child: Text(controller.message));
        }
        if (state == RequestState.success) {
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
        }
        return const SizedBox();
      }),
    );
  }
}
