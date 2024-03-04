import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TerakhirDibaca extends StatelessWidget {
  const TerakhirDibaca({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      margin: REdgeInsets.all(8),
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5).w,
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Get.defaultDialog(title: 'Last read', middleText: 'To Page DetailSurah Last Read.');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal.shade300,
              child: const Text(
                '1',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(
              'Al-Fatihah - Ayat 5',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.teal),
          ],
        ),
      ),
    );
  }
}
