import 'package:muslim_app/app/common/state_enum.dart';

import '../widgets/hadits_content.dart';
import '../widgets/hadits_header.dart';

import '../detail_hadits.dart';

class DetailHaditsContent extends StatelessWidget {
  const DetailHaditsContent({
    super.key,
    required this.controller,
  });

  final DetailHaditsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final state = controller.detailHaditsState.value;
      if (state == RequestState.initial) {
        return const Center(child: SizedBox());
      }
      if (state == RequestState.loading) {
        return const Expanded(child: Center(child: CircularProgressIndicator()));
      }
      if (state != RequestState.success) {
        return const Center(child: Text('Terjadi kesalahan, tidak ada data'));
      }
      return Expanded(
        child: ListView.builder(
          itemCount: controller.allHadits.items!.length,
          itemBuilder: (context, index) {
            final hadits = controller.allHadits.items![index];
            return Padding(
              padding: REdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  HaditsHeader(hadits: hadits),
                  5.verticalSpace,
                  HaditsContent(hadits: hadits),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
