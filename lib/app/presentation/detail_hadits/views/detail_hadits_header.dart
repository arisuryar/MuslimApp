import '../detail_hadits.dart';

class DetailHaditsHeader extends StatelessWidget {
  const DetailHaditsHeader({
    super.key,
    required this.controller,
  });

  final DetailHaditsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.fromLTRB(12, 8, 12, 12),
      height: 100,
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5).w,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Colors.teal.shade200,
            Colors.teal.shade300,
            Colors.teal.shade500,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          transform: const GradientRotation(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'HR. ${controller.arguments.name!}',
            style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          10.verticalSpace,
          Text(
            'Total Hadits : ${controller.arguments.total}',
            style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
