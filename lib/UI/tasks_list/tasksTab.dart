import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/myTheme.dart';
import 'package:todo/UI/tasks_list/taskBuilder.dart';
import 'package:todo/firebase/myDataBase.dart';
import 'package:todo/utils/dialogUtils.dart';

import '../../firebase/Task.dart';

class tasksTab extends StatefulWidget {
  @override
  State<tasksTab> createState() => _tasksTabState();
}

class _tasksTabState extends State<tasksTab> {
  List<Task>allTasks=[];
  var selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    if(allTasks.isEmpty)loadTasks();
    return Container(
      child: Column(
          children: [
            SizedBox(height: 15,),
          (
            CalendarTimeline(
              initialDate: selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days:365)),
              onDateSelected: (date) {
                setState(() {
                  selectedDate=date;
                });
              },
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
              child: StreamBuilder<QuerySnapshot<Task>>(builder: (context, snapshot) {
                if(snapshot.hasError)return Center(child: Text("Error Loading Tasks"),);
                var tasks=snapshot.data?.docs.map((doc) => doc.data()).toList();
                return ListView.builder(itemBuilder: (context, index) {
                  return taskBuilder(
                    tasks![index],
                  );
                },itemCount: tasks?.length??0,);

              },stream: myDataBase.getRealTimeUpdates(selectedDate),

              ),
          ),

        ],
      ),
    );
  }
  void loadTasks() async{
    allTasks = await myDataBase.readTask(selectedDate);
    setState(() {

    });
  }


}
