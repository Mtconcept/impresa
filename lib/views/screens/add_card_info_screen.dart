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
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                child: ListView(
                  children: [
                    navigateBack(context, controller),
                    SizedBox(height: 12),
                    formHeader,
                    formBody(context, controller),
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

  Widget navigateBack(BuildContext context, AddCardInfoController controller) =>
      InkWell(
        onTap: controller.goBack,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.arrow_back,
            ),
          ],
        ),
      );

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
              onFieldSubmitted: controller.focusToPost,
              decoration: InputDecoration(
                hintText: 'Full Name',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.postController,
              focusNode: controller.postFocusNode,
              validator: controller.validateNotEmpty,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: controller.focusToBrandName,
              decoration: InputDecoration(
                hintText: 'Post',
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
              focusNode: controller.phoneNumberFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: controller.focusToBrandAddress,
              decoration: InputDecoration(
                hintText: 'Brand Phone Number (Optional)',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.brandAddressController,
              validator: controller.validateNotEmpty,
              focusNode: controller.brandAddressFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: controller.focusToEmailAddress,
              decoration: InputDecoration(
                hintText: 'Brand Address',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.emailAddressController,
              validator: controller.validateEmail,
              focusNode: controller.emailAddressFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: controller.focusToBusinessTagline,
              decoration: InputDecoration(
                hintText: 'Brand Email Address',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.businessTaglineController,
              focusNode: controller.businessTaglineFocusNode,
              textInputAction: TextInputAction.next,
              validator: controller.validateNotEmpty,
              onFieldSubmitted: controller.focusToSocialMediaHandle,
              decoration: InputDecoration(
                hintText: 'Business Tagline',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.socialMediaHandleController,
              focusNode: controller.socialMediaHandleFocusNode,
              textInputAction: TextInputAction.done,
              validator: controller.validateNotEmpty,
              onFieldSubmitted: (value) => controller.saveCard(id),
              decoration: InputDecoration(
                hintText: 'Social Media Handle',
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
              onPressed: () => controller.saveCard(id),
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
