import '../detail_hadits.dart';

class HaditsContent extends StatelessWidget {
  const HaditsContent({
    super.key,
    required this.hadits,
  });

  final Item hadits;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 3),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              hadits.arab!,
              textAlign: TextAlign.end,
              style: TextStyle(fontFamily: 'Amiri', fontSize: 24.sp, fontWeight: FontWeight.bold, height: 2.5),
            ),
          ),
          10.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              hadits.id!,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 12.sp, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500, color: Colors.teal),
            ),
          ),
        ],
      ),
    );
  }
}
