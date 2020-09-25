import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/add_card_info_controller.dart';
import '../../core/utils/notifier.dart';
import '../widgets/form_header.dart';
import '../widgets/white_safearea.dart';

class AddCardInfoScreen extends StatelessWidget {
  final int id;
  const AddCardInfoScreen({this.id});

  @override
  Widget build(BuildContext context) {
    return WhiteSafeArea(
      child: Scaffold(
        body: SafeArea(
          child: GetBuilder<AddCardInfoController>(
            init: AddCardInfoController(),
            builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    formHeader,
                    SizedBox(height: 20),
                    formBody(controller),
                    SizedBox(height: 40),
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
          title: 'Add Your\nInformation',
        ),
      );

  Widget formBody(AddCardInfoController controller) => Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.fullNameController,
              validator: controller.validateFullName,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: controller.focusToBrandName,
              decoration: InputDecoration(
                hintText: 'Full Name',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.brandNameController,
              validator: controller.validateNotEmpty,
              focusNode: controller.brandNameFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: controller.focusToPhoneNumber,
              decoration: InputDecoration(
                hintText: 'Brand Name',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.phoneNumberController,
              validator: controller.validatePhoneNumber,
              focusNode: controller.phoneNumberFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: controller.focusToBrandAddress,
              decoration: InputDecoration(
                hintText: 'Phone Number',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.brandAddressController,
              validator: controller.validateNotEmpty,
              focusNode: controller.brandAddressFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: controller.focusToBusinessTagline,
              decoration: InputDecoration(
                hintText: 'Brand Address',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.businessTaglineController,
              focusNode: controller.businessTaglineFocusNode,
              textInputAction: TextInputAction.done,
              validator: controller.validateNotEmpty,
              onFieldSubmitted: (value) => controller.saveCard(),
              decoration: InputDecoration(
                hintText: 'Business Tagline',
              ),
            ),
            SizedBox(height: 60),
            Hero(
              tag: 'button',
              child: RaisedButton(
                child: controller.state == NotifierState.isIdle
                    ? Text('Save Card')
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                onPressed: controller.saveCard,
              ),
            ),
          ],
        ),
      );
}
