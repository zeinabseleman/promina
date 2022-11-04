import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
final int itemCount;
final int axisCount;
final double ratio;
final double mainSpacing;
final double crossSpacing;
final Widget Function(BuildContext, int) itemBuilder;
final double startPadding;
final double endPadding;
final bool scroll;


  const CustomGridView({super.key,
required this.itemCount,
required this.axisCount,
required this.ratio,
required this.mainSpacing,
required this.crossSpacing,
required this.itemBuilder,
 this.startPadding=24,
this.endPadding=24,
this.scroll=false

  });


  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        padding: EdgeInsetsDirectional.only(
            start: startPadding,
            end: endPadding),
        shrinkWrap: true,
        physics: (scroll==false)?const PageScrollPhysics():const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: axisCount,
            childAspectRatio: ratio,
            mainAxisSpacing: mainSpacing,
            crossAxisSpacing: crossSpacing
        ),
        itemBuilder: itemBuilder
    );
  }
}
