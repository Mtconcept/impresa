import 'dart:io';

import 'package:flutter/foundation.dart';

class CardParams {
  final String userId;
  final String brandName;
  final String fullName;
  final String jobPosition;
  final String address;
  final String phoneNumber;
  final String emailAddress;
  final String socialOrWebLink;
  final String tagline;
  final File logoImage;

  CardParams({
    @required this.userId,
    @required this.brandName,
    @required this.fullName,
    @required this.jobPosition,
    @required this.address,
    @required this.phoneNumber,
    @required this.emailAddress,
    @required this.socialOrWebLink,
    @required this.tagline,
    @required this.logoImage,
  });
}
