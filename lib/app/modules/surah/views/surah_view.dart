import '../surah.dart';

import 'surah_content.dart';
import 'surah_header.dart';
import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  @override
  final controller = Get.put(SurahController());
  SurahView({super.key});
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
          return const Center(child: Text('Terjadi Kesalahan'));
        }
        return Column(
          children: [
            // Surah Header - View
            SurahHeader(controller: controller),
            // Surah Content - View
            SurahContent(controller: controller),
          ],
        );
      }),
    );
  }
}
