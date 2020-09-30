import 'package:flutter/material.dart';
import '../../core/utils/size_util.dart';

class BusinessCardContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  const BusinessCardContainer({this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeUtil(context).cardWidth,
      height: SizeUtil(context).cardHeight,
      child: Card(
        color: backgroundColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
