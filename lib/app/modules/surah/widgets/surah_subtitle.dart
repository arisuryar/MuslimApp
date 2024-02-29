import '../surah.dart';

class SurahSubtitle extends StatelessWidget {
  const SurahSubtitle({
    super.key,
    required this.surah,
  });

  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${surah.numberOfVerses} Ayat | ${surah.revelation!.id!}',
      style: TextStyle(
        fontSize: 12.sp,
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
