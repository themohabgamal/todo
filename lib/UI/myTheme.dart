import 'package:flutter/material.dart';

class myTheme{
  static const lightPrimary=Color(0xFFF6ECC9);
  static const lightSecondary=Color(0xFF262222);
  static const darkPage=Color(0xFFC1B896);
  static const grey=Color(0xFFC8C9CB);
  static const white=Color(0xFFFFFFFF);
  //-------------------------------------light theme----------------------------------
  static final lightTheme=ThemeData(
scaffoldBackgroundColor: lightPrimary,
primaryColor: lightPrimary,
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontSize:18,fontWeight: FontWeight.bold,color: grey,
      ),headline5: TextStyle(
      fontSize:22,fontWeight: FontWeight.bold,color: grey,
    )
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Colors.red,size: 36),
      unselectedIconTheme: IconThemeData(color: myTheme.grey,size: 36),

    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,

    )
  );
}