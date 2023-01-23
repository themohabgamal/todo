import 'package:flutter/material.dart';

class myTheme {
  static const lightPrimary = Color(0xFFF99520);
  static const lightwhite = Color(0xFFF3F3F7);
  static const grey = Color(0xFFC8C9CB);
  static const teal = Color(0xFC4FC1CB);

  //-------------------------------------light theme----------------------------------
  static final lightTheme = ThemeData(
      bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ))),
      scaffoldBackgroundColor: lightwhite,
      primaryColor: lightPrimary,
      textTheme: const TextTheme(
          headline6: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline5: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: lightPrimary, size: 36),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(color: myTheme.grey, size: 36),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
}
