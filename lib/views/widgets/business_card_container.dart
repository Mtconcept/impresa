import 'package:flutter/material.dart';

class BusinessCardContainer extends StatelessWidget {
  final Widget child;
  const BusinessCardContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.width * 0.5433) - 32,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
