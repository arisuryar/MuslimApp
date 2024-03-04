import '../../../common/state_enum.dart';
import '../../detail_hadits/detail_hadits.dart';
import '../controllers/home_controller.dart';

class JadwalSholat extends StatelessWidget {
  const JadwalSholat({
    super.key,
    required this.controller,
  });

  final HomeController controller;

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
          Obx(
            () {
              final state = controller.sholatState.value;
              if (state == RequestState.initial) {
                return SizedBox(
                  width: Get.width,
                  child: Column(
                    children: [
                      const Text(''),
                      3.verticalSpace,
                      const Text(''),
                    ],
                  ),
                );
              }
              if (state == RequestState.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state != RequestState.success) {
                return const Center(child: Text('Terjadi Kesalahan'));
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text('Imshak', style: TextStyle(fontWeight: FontWeight.w500)),
                      3.verticalSpace,
                      Text(
                        controller.sholat.imsak!,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Shubuh', style: TextStyle(fontWeight: FontWeight.w500)),
                      3.verticalSpace,
                      Text(
                        controller.sholat.fajr!,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Dzuhur', style: TextStyle(fontWeight: FontWeight.w500)),
                      3.verticalSpace,
                      Text(
                        controller.sholat.dhuhr!,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Ashar', style: TextStyle(fontWeight: FontWeight.w500)),
                      3.verticalSpace,
                      Text(
                        controller.sholat.asr!,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Maghrib', style: TextStyle(fontWeight: FontWeight.w500)),
                      3.verticalSpace,
                      Text(
                        controller.sholat.maghrib!,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Isya', style: TextStyle(fontWeight: FontWeight.w500)),
                      3.verticalSpace,
                      Text(
                        controller.sholat.isha!,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
