import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'white_safearea.dart';

class LoadingScreen extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingScreen({
    @required this.child,
    @required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteSafeArea(
      child: Stack(
        children: [
          child,
          isLoading
              ? Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/creating_card.svg"),
                        SizedBox(height: 10.0),
                        Text(
                          'Creating Card',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'We are adding your detail please.\nJust chill a minutes.',
                          style: TextStyle(
                            fontSize: 12.0,
                            height: 1.25,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
