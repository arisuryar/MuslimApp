import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/detail_hadits_controller.dart';

class DetailHaditsView extends GetView<DetailHaditsController> {
  @override
  final controller = Get.put(DetailHaditsController());

  DetailHaditsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HR. ${controller.arguments.name!}',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Column(
          children: [
            Container(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HR. ${controller.arguments.name!}',
                    style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  10.verticalSpace,
                  Text(
                    'Total Hadits : ${controller.arguments.total}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Container(
              height: 50,
              padding: REdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5).w,
                color: Colors.teal.withOpacity(0.1),
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: (controller.arguments.total! / 300).ceil(),
                itemBuilder: (context, index) {
                  int startIndex = index * 300 + 1;
                  int endIndex = (index + 1) * 300;
                  if (endIndex > controller.arguments.total!) {
                    endIndex = controller.arguments.total!;
                  }
                  return Obx(
                    () => InkWell(
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      onTap: () {
                        controller.startIndexHadits.value = startIndex;
                        controller.endIndexHadits.value = endIndex;
                        controller.isSelected = index;
                        controller.getHadits();
                      },
                      child: Container(
                        padding: REdgeInsets.symmetric(horizontal: 5),
                        margin: REdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.isSelected == index ? Colors.teal : Colors.transparent,
                            borderRadius: BorderRadius.circular(3).w),
                        child: Text(
                          ' $startIndex - $endIndex',
                          style: TextStyle(
                              color: controller.isSelected == index ? Colors.white : Colors.black,
                              fontWeight: controller.isSelected == index ? FontWeight.w600 : FontWeight.normal,
                              fontSize: 12.sp),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            10.verticalSpace,
            Obx(() {
              if (controller.status == '') {
                return const Center(child: SizedBox());
              }
              if (controller.status == 'loading') {
                return const Expanded(child: Center(child: CircularProgressIndicator()));
              }
              if (controller.status != 'success') {
                return const Center(child: Text('Terjadi kesalahan, tidak ada data'));
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.allHadits.items!.length,
                  itemBuilder: (context, index) {
                    final hadits = controller.allHadits.items![index];
                    return Padding(
                      padding: REdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: Get.width,
                            alignment: Alignment.centerLeft,
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
                            child: Text(
                              'No. ${hadits.number}',
                              style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                          ),
                          5.verticalSpace,
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 3),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    hadits.arab!,
                                    textAlign: TextAlign.end,
                                    style:
                                        TextStyle(fontFamily: 'Amiri', fontSize: 24.sp, fontWeight: FontWeight.bold, height: 2.5),
                                  ),
                                ),
                                10.verticalSpace,
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    hadits.id!,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.teal),
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
              );
            }),
          ],
        ),
      ),
    );
  }
}
