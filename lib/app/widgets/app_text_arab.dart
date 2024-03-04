import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextArab extends StatelessWidget {
  const TextArab({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        textAlign: TextAlign.end,
        style: TextStyle(fontFamily: 'Amiri', fontSize: 24.sp, fontWeight: FontWeight.bold, height: 2.5),
      ),
    );
  }
}
