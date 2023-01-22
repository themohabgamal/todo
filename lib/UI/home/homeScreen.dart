import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/UI/adder/addTask.dart';
import 'package:todo/UI/myTheme.dart';
import 'package:todo/UI/settings/settingsTab.dart';

import '../tasks_list/tasksTab.dart';

class homeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todopher",
          style: GoogleFonts.oswald(
              textStyle: Theme.of(context).textTheme.headline5?.copyWith(
                  color: myTheme.lightSecondary,
                  fontWeight: FontWeight.w600,
                  fontSize: 40)),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: myTheme.white,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: myTheme.lightPrimary,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        index: selectedIndex,
        items: [
          Icon(Icons.checklist,size: 30,),
          Icon(Icons.add,size: 30,),
          Icon(Icons.settings,size: 30,)
        ],
      ),
      body: screens[selectedIndex],
    );

  }

  List<Widget>screens=[tasksTab(),addTask(),settingsTab()];
}
