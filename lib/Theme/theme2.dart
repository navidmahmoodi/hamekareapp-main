import 'package:hamekare_app/tools/hex_color.dart' '';
import 'package:flutter/material.dart';

enum MyThemeKeys { light, dark, darker }

class MyThemes {
  static final Color activeColor = "09c6ec".toColor();
  static final Color primaryColor = "191800".toColor();
  static final Color secondryColor = "ffdd00".toColor();
  static final Color primaryTextColor = "24265f".toColor();
  static final Color videogrey = "E5E7F0".toColor();
  static final Color textColor1 = grey;
  static final Color brown = "2E2D00".toColor();
  static final Color brown2 = "191800".toColor();
  static final Color brown3 = "2e2d00".toColor();
  static final Color green = "07db86".toColor();
  static final Color red = "db4307".toColor();
  static final Color textfieldbg = "E2E2E2".toColor();
  static Color bgColor = "f8f9fb".toColor();
  static Color yellow = const Color(0xFFf9e81f);
  // static Color blue = Color(0xFF0656f3);
  static Color grey = "878787".toColor();
  static Color settingGrey = "9f9fa1".toColor();

  static final TextTheme textTheme1 = TextTheme(
    bodyText1: bodyText1,
    bodyText2: bodyText2,
    subtitle1: subtitle1,
    headline1: headline1,
    headline2: headline2,
    headline3: headline3,
    button: TextStyle(fontSize: 16, color: textColor1),
  );
  static TextStyle subtitle1 = TextStyle(
      fontSize: 12.7, color: settingGrey, fontWeight: FontWeight.w100);
  static TextStyle subtitle2 = TextStyle(fontSize: 14, color: grey);
  static TextStyle subtitle3 = TextStyle(fontSize: 12, color: primaryColor);
  static TextStyle subtitle4 = TextStyle(fontSize: 12, color: primaryTextColor);
  static TextStyle bodyText1 = TextStyle(fontSize: 18, color: primaryColor);
  static TextStyle bodyText2 =
      TextStyle(fontSize: 18, color: grey, fontWeight: FontWeight.normal);
  static TextStyle smallSettingText = TextStyle(
    fontSize: 14,
    color: settingGrey,
  );
  static TextStyle bodyText3 = TextStyle(
    fontSize: 16,
    color: primaryColor,
    fontWeight: FontWeight.w200,
  );
  static TextStyle headline1 = TextStyle(
    fontSize: 24,
    color: secondryColor,
    fontWeight: FontWeight.normal,
  );

  static TextStyle headline2 = TextStyle(
    fontSize: 27,
    color: primaryColor,
    fontWeight: FontWeight.normal,
  );

  static TextStyle headline3 = TextStyle(
    fontSize: 17,
    color: secondryColor,
    fontWeight: FontWeight.normal,
  );

  static TextStyle headline4 = TextStyle(
    fontSize: 16,
    color: grey,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headline5 = TextStyle(
    fontSize: 22,
    color: primaryColor,
    fontWeight: FontWeight.normal,
  );

  static const EdgeInsetsGeometry buttonPadding =
      EdgeInsets.only(top: 7.5, bottom: 15, left: 10, right: 10);

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: primaryColor, disabledForegroundColor: primaryColor.withOpacity(.2).withOpacity(0.38), disabledBackgroundColor: primaryColor.withOpacity(.2).withOpacity(0.12),
      padding: buttonPadding,
    ),
  );

  static final textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      // onPrimary: Colors.yellow,
      foregroundColor: primaryColor, padding: buttonPadding, disabledForegroundColor: primaryColor.withOpacity(.2).withOpacity(0.38),
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: primaryColor, padding: buttonPadding, disabledForegroundColor: primaryColor.withOpacity(.2).withOpacity(0.38),
      backgroundColor: Colors.white,
      side: BorderSide(width: 1, color: primaryColor),
      // backgroundColor: pink,
    ),
  );

  static final ButtonThemeData buttonTheme = ButtonThemeData(
    buttonColor: primaryColor,
    shape: buttonShape1,
    textTheme: ButtonTextTheme.accent,
    // highlightColor: Colors.grey.shade200,
    padding: buttonPadding,
  );

  static final ShapeBorder buttonShape1 = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
    // side: BorderSide(color: Colors.red)
  );

  static final ShapeBorder buttonShape2 = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  );

  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
    hintStyle: MyThemes.bodyText1,
    filled: true,
    fillColor: Colors.white,
    hoverColor: Colors.white,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: MyThemes.primaryColor, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyThemes.grey, width: 0.7),
        borderRadius: BorderRadius.circular(5)),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: MyThemes.grey, width: 0.7),
        borderRadius: BorderRadius.circular(5)),
    focusColor: primaryColor,
    suffixStyle: const TextStyle(color: Colors.green),
  );

  static final Map<int, Color> primaryColorSwatch = {
    50: const Color.fromRGBO(255, 255, 255, .1),
    100: const Color.fromRGBO(255, 255, 255, .2),
    200: const Color.fromRGBO(255, 255, 255, .3),
    300: const Color.fromRGBO(255, 255, 255, .4),
    400: const Color.fromRGBO(255, 255, 255, .5),
    500: const Color.fromRGBO(255, 255, 255, .6),
    600: const Color.fromRGBO(255, 255, 255, .7),
    700: const Color.fromRGBO(255, 255, 255, .8),
    800: const Color.fromRGBO(255, 255, 255, .9),
    900: const Color.fromRGBO(255, 255, 255, 1),
  };

  static final MaterialColor primarySwatch =
      MaterialColor(0xFFffffff, primaryColorSwatch);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: "f2f2f2".toColor(),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            fontSize: 15, color: primaryTextColor, fontFamily: "Kalameh")),
    fontFamily: 'Kalameh',
    textTheme: textTheme1,
    buttonTheme: buttonTheme,
    inputDecorationTheme: inputDecorationTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    textButtonTheme: textButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    scaffoldBackgroundColor: bgColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: primarySwatch,
      accentColor: Colors.white,
    ),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor,
        selectionColor: primaryColor,
        selectionHandleColor: primaryColor),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey,
    brightness: Brightness.dark,
    fontFamily: 'Kalameh',
  );

  static final ThemeData darkerTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    fontFamily: 'Kalameh',
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.light:
        return lightTheme;
      case MyThemeKeys.darker:
        return darkerTheme;
      default:
        return lightTheme;
    }
  }
}
