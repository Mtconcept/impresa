import 'package:meta/meta.dart';

class CardInfo {
  final String brandName;
  final String fullName;
  final String jobPosition;
  final String address;
  final String phoneNumber;
  final String emailAddress;
  final String socialOrWebLink;
  final String tagline;
  final String logoUrl;

  CardInfo({
    @required this.brandName,
    @required this.fullName,
    @required this.jobPosition,
    @required this.address,
    @required this.phoneNumber,
    @required this.emailAddress,
    @required this.socialOrWebLink,
    @required this.tagline,
    @required this.logoUrl,
  });

  factory CardInfo.app() => CardInfo(
        fullName: 'Your Name',
        brandName: 'Brand Name',
        address: 'Your Full Work Address Here',
        emailAddress: 'Your Email Address Here',
        jobPosition: 'Your Post Here',
        logoUrl: '',
        phoneNumber: 'Your Phone Number Here',
        socialOrWebLink: 'Your Social or Web Link',
        tagline: 'Tagline here',
      );
}
