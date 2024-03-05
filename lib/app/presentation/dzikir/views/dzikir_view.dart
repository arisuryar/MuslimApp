import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../common/state_enum.dart';
import '../../../domain/usecases/get_dzikir.dart';
import '../../../widgets/app_container_tittle.dart';
import '../../../widgets/app_text_arab.dart';
import '../../../widgets/app_text_en.dart';

import '../controllers/dzikir_controller.dart';

class DzikirView extends GetView<DzikirController> {
  final dzikirC = Get.put(DzikirController(Get.find<GetAllDzikir>()));
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
                if (state == RequestState.error) {
                  return Center(child: Text(controller.message));
                }
                if (state == RequestState.success) {
                  final list = dzikirC.dzikir;
                  return ListView.builder(
                    itemCount: list.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final dzikir = list[index];
                      return Column(
                        children: [
                          ContainerTittle(
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
                                TextArab(text: dzikir.arab!),
                                20.verticalSpace,
                                TextEn(text: dzikir.indo!),
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
              }),
            ),
          ],
        ),
      ),
    );
  }
}
