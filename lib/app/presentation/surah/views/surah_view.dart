import '../../../common/state_enum.dart';
import '../../../domain/usecases/get_surah.dart';

import '../surah.dart';

import 'surah_content.dart';
import 'surah_header.dart';
import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  @override
  final controller = Get.put(SurahController(Get.find<GetAllSurah>()));
  SurahView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          final state = controller.surahState.value;
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
            return Column(
              children: [
                // Surah Header - View
                SurahHeader(controller: controller),
                // Surah Content - View
                SurahContent(controller: controller),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
