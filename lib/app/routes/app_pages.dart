import 'package:get/get.dart';

import '../modules/detail_hadits/bindings/detail_hadits_binding.dart';
import '../modules/detail_hadits/views/detail_hadits_view.dart';
import '../modules/detail_surah/bindings/detail_surah_binding.dart';
import '../modules/detail_surah/views/detail_surah_view.dart';
import '../modules/doa/bindings/doa_binding.dart';
import '../modules/doa/views/doa_view.dart';
import '../modules/hadits/bindings/hadits_binding.dart';
import '../modules/hadits/views/hadits_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/surah/bindings/surah_binding.dart';
import '../modules/surah/views/surah_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SURAH,
      page: () => SurahView(),
      binding: SurahBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SURAH,
      page: () => const DetailSurahView(),
      binding: DetailSurahBinding(),
    ),
    GetPage(
      name: _Paths.HADITS,
      page: () => HaditsView(),
      binding: HaditsBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_HADITS,
      page: () => DetailHaditsView(),
      binding: DetailHaditsBinding(),
    ),
    GetPage(
      name: _Paths.DOA,
      page: () => DoaView(),
      binding: DoaBinding(),
    ),
  ];
}
