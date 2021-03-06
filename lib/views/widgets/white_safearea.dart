import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WhiteSafeArea extends StatelessWidget {
  final Widget child;

  const WhiteSafeArea({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: child,
    );
  }
}
