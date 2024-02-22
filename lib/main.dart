import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/data/services/surah_service.dart';

import 'app/routes/app_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final surahService = Get.put(SurahService());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return GetMaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme: const IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
              backgroundColor: Colors.teal,
              scrolledUnderElevation: 0,
              elevation: 0,
              centerTitle: true,
            ),
            fontFamily: 'Poppins',
          ),
          title: "Application",
          initialRoute: Routes.SURAH,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
