import '../../../domain/entities/surah.dart';
import '../../../widgets/app_text_tittle.dart';

import '../../../routes/app_pages.dart';
import '../surah.dart';

import '../controllers/surah_controller.dart';
import '../widgets/widgets.dart';

class SurahContent extends StatelessWidget {
  const SurahContent({
    super.key,
    required this.controller,
  });

  final SurahController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: ListView.builder(
            itemCount: controller.filteredData.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              Surah surah = controller.filteredData[index];
              return ListTile(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_SURAH, arguments: {
                    'id': surah.number.toString(),
                    'name': surah.name.transliteration.id,
                  });
                },
                // Surah Leading - Widgets
                leading: SurahLeading(surah: surah),
                // Surah Tittle - Widgets
                title: TextTittle(text: surah.name.transliteration.id),
                // Surah Subtitle - Widgets
                subtitle: Text(
                  '${surah.numberOfVerses} Ayat | ${surah.revelation.id}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Surah Trailing - Widgets
                trailing: SurahTrailing(surah: surah),
              );
            },
          ),
        ));
  }
}
