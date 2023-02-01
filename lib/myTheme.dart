import 'package:flutter/material.dart';

class myTheme {
  static const lightPrimary = Color(0xFFF99520);
  static const dark = Color(0xFF222225);
  static const dark2=Color(0xFF37373F);
  static const scaff=Color(0xFFEDEDED);
  static const darkGrey = Color(0xFF434242);
  static const grey = Color(0xFFC8C9CB);
  static const teal = Color(0xFC4FC1CB);

  //-------------------------------------light theme----------------------------------
  static final lightTheme = ThemeData(
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ))),
      scaffoldBackgroundColor: scaff,
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
//  -------------------------------------------- dark theme-------------------------------------------
  static final darkTheme = ThemeData(
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: dark2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ))),
      scaffoldBackgroundColor: dark,
      primaryColor: lightPrimary,
      textTheme: const TextTheme(
          headline6: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline5: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
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
        backgroundColor: dark,
        elevation: 0,
      ),

  bottomAppBarTheme: BottomAppBarTheme(
      color: dark2,
  )
  );
}
