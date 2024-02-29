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
    return Expanded(
      child: ListView.builder(
        itemCount: controller.filteredAllSurah.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          SurahModel surah = controller.filteredAllSurah[index];
          return ListTile(
            onTap: () {
              Get.toNamed(Routes.DETAIL_SURAH,
                  arguments: {'id': surah.number.toString(), 'name': surah.name!.transliteration!.id});
            },
            // Surah Leading - Widgets
            leading: SurahLeading(surah: surah),
            // Surah Tittle - Widgets
            title: SurahTittle(surah: surah),
            // Surah Subtitle - Widgets
            subtitle: SurahSubtitle(surah: surah),
            // Surah Trailing - Widgets
            trailing: SurahTrailing(surah: surah),
          );
        },
      ),
    );
  }
}
