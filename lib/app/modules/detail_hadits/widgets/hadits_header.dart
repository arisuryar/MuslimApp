import '../detail_hadits.dart';

class HaditsHeader extends StatelessWidget {
  const HaditsHeader({
    super.key,
    required this.hadits,
  });

  final Item hadits;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      alignment: Alignment.centerLeft,
      padding: REdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5).w,
        color: Colors.teal,
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
      child: Text(
        'No. ${hadits.number}',
        style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
