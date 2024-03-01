import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/common/state_enum.dart';

import '../controllers/dzikir_controller.dart';

class DzikirView extends GetView<DzikirController> {
  final dzikirC = Get.put(DzikirController());
  DzikirView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.fromLTRB(8, 10, 8, 0),
        child: Column(
          children: [
            DropdownMenu(
              expandedInsets: EdgeInsets.zero,
              inputDecorationTheme: InputDecorationTheme(
                isDense: true,
                contentPadding: REdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5).w,
                ),
              ),
              initialSelection: dzikirC.type,
              width: Get.width,
              onSelected: (value) {
                dzikirC.type = value!;
                dzikirC.getDzikir();
              },
              dropdownMenuEntries: dzikirC.listType.map((e) => DropdownMenuEntry(value: e, label: e.capitalizeFirst!)).toList(),
            ),
            8.verticalSpace,
            Expanded(
              child: Obx(() {
                final state = dzikirC.dzikirState.value;
                if (state == RequestState.initial) {
                  return const SizedBox();
                }
                if (state == RequestState.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state != RequestState.success) {
                  return const Center(child: Text('Terjadi kesalahan,tidak ada data'));
                }
                final list = dzikirC.dzikir;
                return ListView.builder(
                  itemCount: list.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final dzikir = list[index];
                    return Column(
                      children: [
                        Container(
                          height: 50,
                          width: Get.width,
                          alignment: Alignment.centerLeft,
                          padding: REdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5).w,
                            color: Colors.teal.withOpacity(0.1),
                          ),
                          child: Text(
                            'Ulang : ${dzikir.ulang}',
                            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        10.verticalSpace,
                        Padding(
                          padding: REdgeInsets.symmetric(horizontal: 3),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  dzikir.arab!,
                                  textAlign: TextAlign.end,
                                  style:
                                      TextStyle(fontFamily: 'Amiri', fontSize: 24.sp, fontWeight: FontWeight.bold, height: 2.5),
                                ),
                              ),
                              20.verticalSpace,
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  dzikir.indo!,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                              20.verticalSpace,
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
