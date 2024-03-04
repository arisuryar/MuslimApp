import '../../../common/state_enum.dart';
import '../../../widgets/app_container_tittle.dart';
import '../../../widgets/app_text_arab.dart';
import '../../../widgets/app_text_en.dart';

import '../detail_hadits.dart';

class DetailHaditsContent extends StatelessWidget {
  const DetailHaditsContent({
    super.key,
    required this.controller,
  });

  final DetailHaditsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final state = controller.detailHaditsState.value;
      if (state == RequestState.initial) {
        return const Center(child: SizedBox());
      }
      if (state == RequestState.loading) {
        return const Expanded(child: Center(child: CircularProgressIndicator()));
      }
      if (state == RequestState.error) {
        return Center(child: Text(controller.message));
      }
      if (state == RequestState.success) {
        return Expanded(
          child: ListView.builder(
            itemCount: controller.detailHadits.items!.length,
            itemBuilder: (context, index) {
              final hadits = controller.detailHadits.items![index];
              return Padding(
                padding: REdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    ContainerTittle(
                      child: Text(
                        'No. ${hadits.number}',
                        style: TextStyle(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    5.verticalSpace,
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 3),
                      child: Column(
                        children: [
                          TextArab(text: hadits.arab!),
                          10.verticalSpace,
                          TextEn(text: hadits.id!),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }
      return const SizedBox();
    });
  }
}
