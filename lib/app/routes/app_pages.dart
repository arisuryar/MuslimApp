import 'package:get/get.dart';

import '../presentation/detail_hadits/bindings/detail_hadits_binding.dart';
import '../presentation/detail_hadits/views/detail_hadits_view.dart';
import '../presentation/detail_surah/bindings/detail_surah_binding.dart';
import '../presentation/detail_surah/views/detail_surah_view.dart';
import '../presentation/doa/bindings/doa_binding.dart';
import '../presentation/doa/views/doa_view.dart';
import '../presentation/dzikir/bindings/dzikir_binding.dart';
import '../presentation/dzikir/views/dzikir_view.dart';
import '../presentation/hadits/bindings/hadits_binding.dart';
import '../presentation/hadits/views/hadits_view.dart';
import '../presentation/home/bindings/home_binding.dart';
import '../presentation/home/views/home_view.dart';
import '../presentation/surah/bindings/surah_binding.dart';
import '../presentation/surah/views/surah_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
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
    GetPage(
      name: _Paths.DZIKIR,
      page: () => DzikirView(),
      binding: DzikirBinding(),
    ),
  ];
}
