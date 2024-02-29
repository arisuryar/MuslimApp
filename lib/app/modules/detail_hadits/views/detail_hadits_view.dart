import 'detail_hadits_content.dart';
import 'detail_hadits_list.dart';
import 'detail_hadits_header.dart';

import '../detail_hadits.dart';

class DetailHaditsView extends GetView<DetailHaditsController> {
  @override
  final controller = Get.put(DetailHaditsController());

  DetailHaditsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HR. ${controller.arguments.name!}',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Column(
          children: [
            // Detail Hadits Header - View
            DetailHaditsHeader(controller: controller),

            10.verticalSpace,

            // Detail Hadits List - View
            DetailHaditsList(controller: controller),

            10.verticalSpace,

            // Detail Hadits Content - View
            DetailHaditsContent(controller: controller),
          ],
        ),
      ),
    );
  }
}
