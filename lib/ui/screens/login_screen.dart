import 'package:flutter/material.dart';

import '../widgets/form_header.dart';
import '../widgets/white_safearea.dart';

class LoginScreen extends StatelessWidget {
  bool pressed = true;
  @override
  Widget build(BuildContext context) {
    return WhiteSafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  formHeader,
                  SizedBox(height: 40),
                  formBody,
                  SizedBox(height: 40),
                  haveAnAccount(context),
                  SizedBox(height: 40),
                  continueWithoutLogin(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get formHeader => FormHeader(
        title: 'Get Started',
        description:
            'It’s great you are here your business life is about to go digitial',
      );

  Widget get formBody => Form(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Full Name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email Address',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Phone Number',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: pressed,
              decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                      icon: Icon( pressed? Icons.remove_red_eye:Icons.remove_red_eye), onPressed: (){
                      
                      })),
            ),
            SizedBox(height: 60),
            RaisedButton(
              child: Text('Sign Up'),
              onPressed: () {},
            )
          ],
        ),
      );

  Widget haveAnAccount(BuildContext context) => RichText(
        text: TextSpan(
          text: 'Already have an account',
          style: Theme.of(context).textTheme.subtitle2,
          children: <TextSpan>[
            TextSpan(
              text: ' Login',
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      );

  Widget continueWithoutLogin(BuildContext context) => RichText(
        text: TextSpan(
          text: 'Continue without',
          style: Theme.of(context).textTheme.subtitle2,
          children: <TextSpan>[
            TextSpan(
              text: ' Login',
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      );
}
