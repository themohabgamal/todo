import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/UI/myTheme.dart';
import 'package:todo/UI/tasks_list/taskBuilder.dart';

class tasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
            SizedBox(height: 15,),
          (
            CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days:365)),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              shrink: true,
              monthColor: Colors.blueGrey,
              dayColor: myTheme.teal,
              activeDayColor: Colors.white,
              activeBackgroundDayColor: myTheme.lightPrimary,
              dotsColor: Color(0xFF333A47),
              locale: 'en_ISO',
            )
          ),
          SizedBox(height: 10,),
          Expanded(
              child: ListView.builder(
                itemCount: 5,
            itemBuilder: (context, index) {
              return taskBuilder();
            },
          ))
        ],
      ),
    );
  }
}
