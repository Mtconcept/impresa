import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;

  PageIndicator({@required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Indicator(
          positionIndex: 0,
          currentIndex: currentIndex,
        ),
        SizedBox(
          width: 12,
        ),
        Indicator(
          positionIndex: 1,
          currentIndex: currentIndex,
        ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;

  const Indicator({this.currentIndex, this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 6,
      decoration: BoxDecoration(
          color: positionIndex == currentIndex
              ? Color(0xFFE4E4E4)
              : Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
