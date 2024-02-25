import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JadwalSholat extends StatelessWidget {
  const JadwalSholat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5).w,
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text('Imshak'),
                  3.verticalSpace,
                  const Text('04:00'),
                ],
              ),
              Column(
                children: [
                  const Text('Shubuh'),
                  3.verticalSpace,
                  const Text('04:10'),
                ],
              ),
              Column(
                children: [
                  const Text('Dzuhur'),
                  3.verticalSpace,
                  const Text('12:10'),
                ],
              ),
              Column(
                children: [
                  const Text('Ashar'),
                  3.verticalSpace,
                  const Text('15:10'),
                ],
              ),
              Column(
                children: [
                  const Text('Maghrib'),
                  3.verticalSpace,
                  const Text('18:30'),
                ],
              ),
              Column(
                children: [
                  const Text('Isya'),
                  3.verticalSpace,
                  const Text('19:30'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
