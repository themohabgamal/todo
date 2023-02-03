import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/myTheme.dart';
import 'package:todo/UI/settings/settingsTab.dart';
import 'package:todo/UI/tasks_list/taskBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
           "Todoly",
          style: GoogleFonts.oswald(
              textStyle: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 40)),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          showMyBottomSheet();
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: myTheme.teal,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.list_bullet), label: "CheckList"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings), label: "Settings")
          ],
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          currentIndex: selectedIndex,
        ),
      ),
      body: screens[selectedIndex],
    );
  }

  List<Widget> screens = [tasksTab(), settingsTab()];

  void showMyBottomSheet() {
    showModalBottomSheet(context: context, builder: (context) {
      return Wrap(children: [taskBottomSheetBuilder()],);
    },);
  }
}
