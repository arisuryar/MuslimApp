import 'package:muslim_app/app/common/state_enum.dart';

import '../hadits.dart';
import 'hadits_content.dart';

import '../controllers/hadits_controller.dart';

class HaditsView extends GetView<HaditsController> {
  @override
  final controller = Get.put(HaditsController());
  HaditsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          final state = controller.haditsState.value;
          if (state == RequestState.initial) {
            return const Center(child: SizedBox());
          }
          if (state == RequestState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state != RequestState.success) {
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
              return HaditsContent(hadits: hadits);
            },
          );
        },
      ),
    );
  }
}
