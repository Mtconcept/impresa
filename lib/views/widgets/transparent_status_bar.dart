import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransparentStatusBar extends StatelessWidget {
  final Widget child;

  const TransparentStatusBar({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Theme.of(context).primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: child,
    );
  }
}
