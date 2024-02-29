import '../surah.dart';

class SurahTittle extends StatelessWidget {
  const SurahTittle({
    super.key,
    required this.surah,
  });

  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return Text(
      surah.name!.transliteration!.id!,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
    );
  }
}
