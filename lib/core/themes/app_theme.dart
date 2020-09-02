import 'package:flutter/material.dart';

class AppTheme {
  static const _white = Color(0xFFFFFFFF);
  static const _black = Color(0xFF000000);

  static const _lightGrey = Color(0xFF817F7F);
  static const _darkGrey = Color(0xFF120E1A);

  static const _primaryColor = Color(0xFF654B90);
  static const _primaryVariantColor = Color(0xFF917EB1);

  static const _secondaryColor = Color(0xFF76904B);
  static const _secondaryVariantColor = Color(0xFF9DB85D);

  static const _errorColor = Color(0xFFB00020);

  static ColorScheme _colorScheme = ColorScheme(
    primary: _primaryColor,
    primaryVariant: _primaryVariantColor,
    secondary: _secondaryColor,
    secondaryVariant: _secondaryVariantColor,
    surface: _white,
    error: _errorColor,
    onSecondary: _black,
    onBackground: _darkGrey,
    onSurface: _lightGrey,
    background: _white,
    onError: _white,
    onPrimary: _white,
    brightness: Brightness.light,
  );

  /// TextStyles Usage
  /// Headline4 - Primary Title i.e Impresa
  /// Headline5 - Form Title i.e Form Title
  /// Subtitle1 - Primary Description i.e onboarding description
  /// Subtitle2 - Titles without real emphasis i.e Continue without login
  /// BodyText1 - Regular Texts i.e TextField hintText
  /// BodyText2 - Small Description i.e Form Title Description
  /// Button - Button Text

  static TextTheme _textTheme(ColorScheme colorScheme) {
    return TextTheme(
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: colorScheme.primary,
      ),
      headline5: TextStyle(
        fontSize: 24,
        color: colorScheme.onBackground,
      ),
      subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: colorScheme.onBackground,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        color: colorScheme.onBackground,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        color: colorScheme.onSurface,
      ),
      bodyText2: TextStyle(
        fontSize: 12,
        color: colorScheme.onSurface,
      ),
      button: TextStyle(
        fontSize: 16,
        color: colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static ButtonThemeData _buttonThemeData(ColorScheme colorScheme) {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      colorScheme: colorScheme,
      height: 54,
      minWidth: double.infinity,
    );
  }

  static InputDecorationTheme _inputDecorationTheme(TextTheme textTheme) {
    return InputDecorationTheme(
      hintStyle: textTheme.subtitle2,
    );
  }

  static ThemeData _themeData(
    ColorScheme colorScheme,
  ) {
    return ThemeData(
      fontFamily: 'JosefinSans',
      colorScheme: colorScheme,
      textTheme: _textTheme(colorScheme),
      buttonTheme: _buttonThemeData(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(_textTheme(colorScheme)),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      backgroundColor: colorScheme.background,
      primaryColor: colorScheme.primary,
      accentColor: colorScheme.secondary,
      buttonColor: colorScheme.primary,
      errorColor: colorScheme.error,
      primaryColorLight: colorScheme.primaryVariant,
    );
  }

  static ThemeData lightThemeData = _themeData(
    _colorScheme,
  );
}
