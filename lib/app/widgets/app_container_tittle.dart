import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContainerTittle extends StatelessWidget {
  const ContainerTittle({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      alignment: Alignment.centerLeft,
      padding: REdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5).w,
        color: Colors.teal.withOpacity(0.2),
      ),
      child: child,
    );
  }
}
