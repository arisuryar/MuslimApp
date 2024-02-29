import '../surah.dart';

class SurahTrailing extends StatelessWidget {
  const SurahTrailing({
    super.key,
    required this.surah,
  });

  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return Text(
      surah.name!.short!,
      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.teal, fontFamily: 'Amiri'),
    );
  }
}
