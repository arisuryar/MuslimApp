import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextEn extends StatelessWidget {
  const TextEn({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 12.sp, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500, color: Colors.teal),
      ),
    );
  }
}
