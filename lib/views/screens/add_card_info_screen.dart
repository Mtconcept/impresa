import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/add_card_info_controller.dart';
import '../../core/utils/notifier.dart';
import '../widgets/dashed_border_container.dart';
import '../widgets/form_header.dart';
import '../widgets/loading_screen.dart';
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
            builder: (controller) => LoadingScreen(
              isLoading: controller.state == NotifierState.isLoading,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      formHeader,
                      SizedBox(height: 20),
                      formBody(context, controller),
                      SizedBox(height: 40),
                    ],
                  ),
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

  Widget formBody(BuildContext context, AddCardInfoController controller) =>
      Form(
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
            SizedBox(height: 20),
            uploadImage(context, controller),
            SizedBox(height: 40),
            RaisedButton(
              child: controller.state == NotifierState.isIdle
                  ? Text('Save Card')
                  : CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
              onPressed: controller.saveCard,
            ),
          ],
        ),
      );

  Row uploadImage(BuildContext context, AddCardInfoController controller) =>
      Row(
        children: [
          controller.image == null
              ? GestureDetector(
                  onTap: controller.getImage,
                  child: DashedBorderContainer(
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: controller.getImage,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Image.file(
                      controller.image,
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          SizedBox(width: 36.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload Photo',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
              SizedBox(height: 6.0),
              Text(
                'Maximum Logo Size\n500×750dpi',
                style: TextStyle(
                  fontSize: 10.0,
                  height: 1.15,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          )
        ],
      );
}
