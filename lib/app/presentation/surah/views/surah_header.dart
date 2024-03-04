import '../surah.dart';
import '../controllers/surah_controller.dart';

class SurahHeader extends StatelessWidget {
  const SurahHeader({
    super.key,
    required this.controller,
  });

  final SurahController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.fromLTRB(8, 5, 8, 5),
      child: TextField(
        onChanged: (value) => controller.filteredSurah(value),
        cursorColor: Colors.teal,
        decoration: InputDecoration(
          hintText: 'Cari Surah',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5).w, borderSide: BorderSide.none),
          isDense: true,
          fillColor: Colors.teal.withOpacity(0.1),
          filled: true,
          contentPadding: REdgeInsets.fromLTRB(20, 18, 0, 18),
        ),
      ),
    );
  }
}
