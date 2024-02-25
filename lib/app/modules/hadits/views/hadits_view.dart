import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/routes/app_pages.dart';

import '../controllers/hadits_controller.dart';

class HaditsView extends GetView<HaditsController> {
  @override
  final controller = Get.put(HaditsController());
  HaditsView({super.key});
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
          return const Center(child: Text('Terjadi kesalahan, tidak ada data'));
        }
        final allHadits = controller.allHadits;
        return GridView.builder(
          padding: REdgeInsets.fromLTRB(8, 5, 8, 5),
          itemCount: allHadits.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisExtent: 80,
          ),
          itemBuilder: (context, index) {
            final hadits = allHadits[index];
            return GestureDetector(
              onTap: () => Get.toNamed(Routes.DETAIL_HADITS, arguments: hadits),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5).w),
                color: Colors.white,
                shadowColor: Colors.black,
                child: Padding(
                  padding: REdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HR. ${hadits.name}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      5.verticalSpace,
                      Text(
                        'Total Hadits : ${hadits.total}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
