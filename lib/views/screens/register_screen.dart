import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:impresa/controllers/login_anonymously_controller.dart';

import '../../controllers/register_controller.dart';
import '../../core/utils/notifier.dart';
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
                    continueWithoutSignUp(context),
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
              controller: controller.fullNameController,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: controller.focusToEmail,
              validator: controller.validateFullName,
              decoration: InputDecoration(
                hintText: 'Full Name',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.emailAddressController,
              textInputAction: TextInputAction.next,
              focusNode: controller.emailFocusNode,
              onFieldSubmitted: controller.focusToPhone,
              validator: controller.validateEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email Address',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.phoneNumberController,
              textInputAction: TextInputAction.next,
              focusNode: controller.phoneFocusNode,
              keyboardType: TextInputType.number,
              maxLength: 11,
              onFieldSubmitted: controller.focusToPassword,
              validator: controller.validatePhoneNumber,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                counterText: "",
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.passwordController,
              focusNode: controller.passwordFocusNode,
              textInputAction: TextInputAction.done,
              obscureText: controller.showPasswordField,
              validator: controller.validatePassword,
              onFieldSubmitted: (value) {
                controller.registerUser();
              },
              decoration: InputDecoration(
                hintText: 'Password',
                suffix: controller.showPasswordField
                    ? GestureDetector(
                        onTap: controller.togglePasswordFieldVisibility,
                        child: Text('Show'))
                    : GestureDetector(
                        onTap: controller.togglePasswordFieldVisibility,
                        child: Text('Hide')),
              ),
            ),
            SizedBox(height: 60),
            Hero(
              tag: 'button',
              child: RaisedButton(
                child: controller.state == NotifierState.isIdle
                    ? Text('Sign Up')
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
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

  Widget continueWithoutSignUp(BuildContext context) =>
      GetBuilder<LoginAnonymouslyController>(
        init: LoginAnonymouslyController(),
        builder: (controller) => controller.state == NotifierState.isLoading
            ? Text(
                'Please wait...',
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              )
            : RichText(
                text: TextSpan(
                  text: 'Continue without',
                  recognizer: controller.loginAnonymously,
                  style: Theme.of(context).textTheme.subtitle2,
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Sign up',
                      recognizer: controller.loginAnonymously,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
      );
}
