import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../doa/views/doa_view.dart';
import '../../dzikir/views/dzikir_view.dart';
import '../../hadits/views/hadits_view.dart';
import '../widgets/jadwal_sholat.dart';
import '../widgets/terakhir_dibaca.dart';
import '../../surah/views/surah_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  final controller = Get.find<HomeController>();
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Muslim App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.white),
              onPressed: () async => controller.getSholat(),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              width: Get.width,
              margin: REdgeInsets.all(8),
              padding: REdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5).w,
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
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.date,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            controller.time,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                  10.verticalSpace,
                  JadwalSholat(controller: controller),
                  10.verticalSpace,
                  Center(
                    child: Obx(() => Text(
                          controller.city,
                          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 13.sp),
                        )),
                  ),
                ],
              ),
            ),
            const TerakhirDibaca(),
            TabBar(
              tabs: controller.tab.map((e) => Tab(text: e)).toList(),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.teal,
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              dividerColor: Colors.grey,
              padding: REdgeInsets.symmetric(horizontal: 8),
              labelStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: Colors.teal),
              unselectedLabelStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.grey),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SurahView(),
                  HaditsView(),
                  DoaView(),
                  DzikirView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
