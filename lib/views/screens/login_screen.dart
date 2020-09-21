import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_anonymously_controller.dart';
import '../../controllers/login_controller.dart';
import '../../core/utils/notifier.dart';
import '../widgets/form_header.dart';
import '../widgets/white_safearea.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WhiteSafeArea(
      child: Scaffold(
        body: SafeArea(
          child: GetBuilder<LoginController>(
            init: LoginController(),
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
          title: 'Login',
          description: 'Yoo! Glad to have you back lets continue the journey',
        ),
      );

  Widget formBody(LoginController controller) => Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.emailAddressController,
              validator: controller.validateEmail,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: controller.focusToPassword,
              decoration: InputDecoration(
                hintText: 'Email Address',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.passwordController,
              focusNode: controller.passwordFocusNode,
              textInputAction: TextInputAction.done,
              obscureText: controller.showPasswordField,
              onFieldSubmitted: (value) {
                controller.loginUser();
              },
              validator: controller.validatePassword,
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
                    ? Text('Sign In')
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                onPressed: controller.loginUser,
              ),
            ),
          ],
        ),
      );

  Widget haveAnAccount(BuildContext context, LoginController controller) =>
      RichText(
        text: TextSpan(
          text: 'Don\'t have an account',
          style: Theme.of(context).textTheme.subtitle2,
          children: <TextSpan>[
            TextSpan(
              recognizer: controller.register,
              text: ' Create Account',
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      );

  Widget continueWithoutLogin(BuildContext context) =>
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
                      text: ' Login',
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
