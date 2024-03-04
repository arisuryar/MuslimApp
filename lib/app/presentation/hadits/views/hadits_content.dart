import '../../../domain/entities/hadits.dart';

import '../../../routes/app_pages.dart';
import '../hadits.dart';

class HaditsContent extends StatelessWidget {
  const HaditsContent({
    super.key,
    required this.hadits,
  });

  final Hadits hadits;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_HADITS, arguments: hadits),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5).w),
        color: Colors.white,
        shadowColor: Colors.black,
        child: Padding(
          padding: REdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HR. ${hadits.name}',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              5.verticalSpace,
              Text(
                'Total Hadits : ${hadits.total}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
