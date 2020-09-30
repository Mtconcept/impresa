import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'white_safearea.dart';

class LoadingScreen extends StatefulWidget {
  final Widget child;
  final bool isLoading;

  const LoadingScreen({
    @required this.child,
    @required this.isLoading,
  });

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    )..addListener(() => setState(() {}));
    animation = Tween<double>(
      begin: 10.0,
      end: 20.0,
    ).animate(animationController);

    animationController.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WhiteSafeArea(
      child: Stack(
        children: [
          widget.child,
          widget.isLoading
              ? Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/creating_card.svg"),
                        AnimatedBuilder(
                          animation: animation,
                          builder: (
                            _,
                            h,
                          ) {
                            return SizedBox(height: animation.value);
                          },
                        ),
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
