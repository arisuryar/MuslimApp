import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/modules/doa/views/doa_view.dart';
import 'package:muslim_app/app/modules/dzikir/views/dzikir_view.dart';
import 'package:muslim_app/app/modules/hadits/views/hadits_view.dart';
import 'package:muslim_app/app/modules/home/widgets/jadwal_sholat.dart';
import 'package:muslim_app/app/modules/home/widgets/terakhir_dibaca.dart';
import 'package:muslim_app/app/modules/surah/views/surah_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Muslim App'),
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('25 Februari 2024'),
                      Text('09:20'),
                    ],
                  ),
                  10.verticalSpace,
                  const JadwalSholat(),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_sharp,
                        size: 14,
                      ),
                      Text(
                        'Kota Tangerang',
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
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
              // indicator: BoxDecoration(borderRadius: BorderRadius.circular(5).w, color: Colors.amber),
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
