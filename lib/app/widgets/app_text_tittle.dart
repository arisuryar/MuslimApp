import '../presentation/detail_hadits/detail_hadits.dart';

class TextTittle extends StatelessWidget {
  const TextTittle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
    );
  }
}
