import 'package:flutter/material.dart';

import '../widgets/transparent_status_bar.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransparentStatusBar(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'impresa',
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                strokeWidth: 6,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
