import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/register_controller.dart';
import '../widgets/form_header.dart';
import '../widgets/white_safearea.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WhiteSafeArea(
      child: Scaffold(
        body: SafeArea(
          child: GetBuilder<RegisterController>(
            init: RegisterController(),
            builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    formHeader,
                    SizedBox(height: 40),
                    formBody(controller),
                    SizedBox(height: 40),
                    haveAnAccount(context, controller),
                    SizedBox(height: 40),
                    continueWithoutLogin(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get formHeader => Hero(
        tag: 'header',
        child: FormHeader(
          title: 'Get Started',
          description:
              'It’s great you are here your business life is about to go digitial',
        ),
      );

  Widget formBody(RegisterController controller) => Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                controller.fullName = value;
              },
              validator: controller.validateFullName,
              decoration: InputDecoration(
                hintText: 'Full Name',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                controller.email = value;
              },
              validator: controller.validateEmail,
              decoration: InputDecoration(
                hintText: 'Email Address',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                controller.phoneNumber = value;
              },
              validator: controller.validatePhoneNumber,
              decoration: InputDecoration(
                hintText: 'Phone Number',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                controller.password = value;
              },
              validator: controller.validatePassword,
              decoration:
                  InputDecoration(hintText: 'Password', suffix: Text('show')),
            ),
            SizedBox(height: 60),
            Hero(
              tag: 'button',
              child: RaisedButton(
                child: Text('Sign Up'),
                onPressed: controller.registerUser,
              ),
            ),
          ],
        ),
      );

  Widget haveAnAccount(BuildContext context, RegisterController controller) =>
      RichText(
        text: TextSpan(
          text: 'Already have an account',
          style: Theme.of(context).textTheme.subtitle2,
          children: <TextSpan>[
            TextSpan(
              text: ' Login',
              recognizer: controller.login,
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
