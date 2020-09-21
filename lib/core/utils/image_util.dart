class ImageUtil {
  static const cardImagePath = 'assets/images';
  static const cardSvgPath = 'assets/svg';

  /// Returns [Card Front Background Image Path] by [Card Number]
  /// The Image should be an [SVG Image] and be placed under [assets/svg]
  /// Example File Name [card1_front_bg.svg]

  static String frontBg(int cardNumber) {
    return '$cardSvgPath/card${cardNumber}_front_bg.svg';
  }

  /// Method returns [Card Back Background Image path] by [Card Number]
  /// The Image should be an [SVG Image] and be placed under [assets/svg]
  /// Example File Name [card1_back_bg.svg]

  static String backBg(int cardNumber) {
    return '$cardSvgPath/card${cardNumber}_back_bg.svg';
  }

  /// Returns [Card Logo Image Path] by [Card number]
  /// The Image should be a [PNG Image] and be placed under [assets/svg]
  /// Example File Name [card1_logo.png]

  static String logo(int cardNumber) {
    return '$cardImagePath/card${cardNumber}_logo.png';
  }
}
