import '../surah.dart';

class SurahLeading extends StatelessWidget {
  const SurahLeading({
    super.key,
    required this.surah,
  });

  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.teal[300],
      child: Text(
        '${surah.number}',
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
