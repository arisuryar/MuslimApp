import '../detail_hadits.dart';

class DetailHaditsList extends StatelessWidget {
  const DetailHaditsList({
    super.key,
    required this.controller,
  });

  final DetailHaditsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: REdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5).w,
        color: Colors.teal.withOpacity(0.1),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: (controller.arguments.total! / 300).ceil(),
        itemBuilder: (context, index) {
          int startIndex = index * 300 + 1;
          int endIndex = (index + 1) * 300;
          if (endIndex > controller.arguments.total!) {
            endIndex = controller.arguments.total!;
          }
          return Obx(
            () => InkWell(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              onTap: () {
                controller.startIndexHadits.value = startIndex;
                controller.endIndexHadits.value = endIndex;
                controller.isSelected = index;
                controller.getHadits();
              },
              child: Container(
                padding: REdgeInsets.symmetric(horizontal: 5),
                margin: REdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: controller.isSelected == index ? Colors.teal : Colors.transparent,
                    borderRadius: BorderRadius.circular(3).w),
                child: Text(
                  ' $startIndex - $endIndex',
                  style: TextStyle(
                      color: controller.isSelected == index ? Colors.white : Colors.black,
                      fontWeight: controller.isSelected == index ? FontWeight.w600 : FontWeight.normal,
                      fontSize: 12.sp),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
