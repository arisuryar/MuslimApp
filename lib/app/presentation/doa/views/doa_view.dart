import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../common/state_enum.dart';
import '../../../widgets/app_container_tittle.dart';
import '../../../widgets/app_text_arab.dart';
import '../../../widgets/app_text_en.dart';

import '../controllers/doa_controller.dart';

class DoaView extends GetView<DoaController> {
  final doaC = Get.put(DoaController(Get.find()));
  DoaView({super.key});
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
              initialSelection: doaC.source,
              width: Get.width,
              onSelected: (value) {
                doaC.source = value!;
                doaC.getDoa();
              },
              dropdownMenuEntries: doaC.listSource.map((e) => DropdownMenuEntry(value: e, label: e.capitalizeFirst!)).toList(),
            ),
            8.verticalSpace,
            Expanded(
              child: Obx(
                () {
                  final state = doaC.doaState.value;
                  if (state == RequestState.initial) {
                    return const SizedBox();
                  }
                  if (state == RequestState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state == RequestState.error) {
                    return Center(child: Text(controller.message));
                  }
                  if (state == RequestState.success) {
                    final list = doaC.doa;
                    return ListView.builder(
                      itemCount: list.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final doa = list[index];
                        return Column(
                          children: [
                            ContainerTittle(
                              child: Text(
                                doa.judul!,
                                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                              ),
                            ),
                            10.verticalSpace,
                            Padding(
                              padding: REdgeInsets.symmetric(horizontal: 3),
                              child: Column(
                                children: [
                                  TextArab(text: doa.arab!),
                                  20.verticalSpace,
                                  TextEn(text: doa.indo!.replaceAll('\r\n', '')),
                                  20.verticalSpace,
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
