import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/common/helpers/config.dart';
import 'package:get_it/get_it.dart';

class AppTheme {
  static MyTheme get currentTheme => GetIt.I<MyTheme>();
  static ThemeMode get themeMode => GetIt.I<MyTheme>().currentTheme();

  static ThemeData lightTheme({
    required BuildContext context,
  }) {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: currentTheme.currentColor(),
        cursorColor: currentTheme.currentColor(),
        selectionColor: currentTheme.currentColor(),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(width: 1.5, color: currentTheme.currentColor()),
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        backgroundColor: currentTheme.currentColor(),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: AppTheme.themeMode == ThemeMode.system
              ? MediaQuery.platformBrightnessOf(context) == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark
              : AppTheme.themeMode == ThemeMode.dark
                  ? Brightness.light
                  : Brightness.dark,
        ),
      ),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      disabledColor: Colors.grey[600],
      brightness: Brightness.light,
      indicatorColor: currentTheme.currentColor(),
      progressIndicatorTheme: const ProgressIndicatorThemeData()
          .copyWith(color: currentTheme.currentColor()),
      iconTheme: IconThemeData(
        color: Colors.grey[800],
        opacity: 1.0,
        size: 24.0,
      ),
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Colors.grey[800],
            brightness: Brightness.light,
            secondary: currentTheme.currentColor(),
          ),
    );
  }
}
