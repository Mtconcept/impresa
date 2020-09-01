import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding_controller.dart';
import '../widgets/onboarding_bottom_sheet.dart';
import '../widgets/white_status_bar.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return WhiteStatusBar(
      child: Scaffold(
        body: SafeArea(
          child: GetBuilder<OnboardingController>(
            init: OnboardingController(),
            builder: (controller) => Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: title,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: bottomSheets(controller),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: pageView(controller),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get title => Padding(
        padding: EdgeInsets.only(top: 24),
        child: Text(
          'Impresa',
          style: Theme.of(context).textTheme.headline4,
        ),
      );

  Widget pageView(OnboardingController controller) => PageView(
        controller: controller.pageController,
        onPageChanged: controller.onChangedFunction,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/onboarding1.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/onboarding2.png',
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      );

  Widget bottomSheets(OnboardingController controller) =>
      controller.currentIndex == 0
          ? OnboardingBottomSheet(
              title: 'Create your Business Idenity with less hassle',
              description:
                  'With just your smartphone you can create your business identity, through our highly curated everly updated templates, very easy to use and concise in manner.',
              onNextPressed: controller.nextFunction,
              currentIndex: controller.currentIndex,
              onSkipPressed: controller.register,
            )
          : OnboardingBottomSheet(
              title: 'Share your Digital Identiity',
              description:
                  'Let people keep a memory of you as soon as possible with this digital business card no ned to hold bulky card in your pocket when you can share it over your device.',
              onNextPressed: controller.register,
              currentIndex: controller.currentIndex,
              onSkipPressed: controller.register,
            );
}
