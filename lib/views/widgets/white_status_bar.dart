import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WhiteStatusBar extends StatelessWidget {
  final Widget child;

  const WhiteStatusBar({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: child,
    );
  }
}
