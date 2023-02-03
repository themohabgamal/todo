import 'package:flutter/material.dart';
import 'package:todo/UI/home/homeScreen.dart';
import 'package:todo/myTheme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/firebase/myDataBase.dart';
import 'package:todo/utils/dialogUtils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../firebase/Task.dart';

class taskBuilder extends StatefulWidget {
  Task task;
  taskBuilder(this.task);

  @override
  State<taskBuilder> createState() => _taskBuilderState();
}

class _taskBuilderState extends State<taskBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          extentRatio: .2,
          children: [
            SlidableAction(
              onPressed: (context) {
                deleteTask();
              },
              icon: Icons.delete,
              foregroundColor: Colors.white,
              label: AppLocalizations.of(context)!.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18)),
            )
          ],
        ),
        child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: myTheme.lightPrimary,
            borderRadius: BorderRadius.circular(15),
          ),
          //---------------------------------done container------------------------------------
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.task.title,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          widget.task.description,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    TaskDone();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Icon(Icons.check, color: Colors.white),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: myTheme.teal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteTask() {
    dialogUtils.messageDialog(
      context,
      AppLocalizations.of(context)!.areYouSure,
      posActionTitle: AppLocalizations.of(context)!.yes,
      posAction: () {
        dialogUtils.showWaitingDialog(context, "Deleting task...");
         myDataBase.deleteTask(widget.task);
        Navigator.pop(context);
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            content: Text(AppLocalizations.of(context)!.taskWasDeleted),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text(AppLocalizations.of(context)!.ok)),
              TextButton(onPressed: () { Navigator.pop(context);
                myDataBase.insertTask(widget.task);
                }, child: Text(AppLocalizations.of(context)!.undo)),
            ],);
        },);
      },
      negActionTitle: AppLocalizations.of(context)!.cancel,
      negAction: () {
        Navigator.maybePop(context);
      },
    );
    setState(() {});
  }
  void TaskDone() {
    dialogUtils.messageDialog(
      context,
      AppLocalizations.of(context)!.haveYouDone,
      posActionTitle: AppLocalizations.of(context)!.yes,
      posAction: () {
        dialogUtils.showWaitingDialog(context, "Deleting task...");
        myDataBase.deleteTask(widget.task);
        Navigator.pop(context);
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            content: Text(AppLocalizations.of(context)!.greatJob),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text(AppLocalizations.of(context)!.ok)),
            ],);
        },);
      },
      negActionTitle: AppLocalizations.of(context)!.cancel,
      negAction: () {
        Navigator.maybePop(context);
      },
    );
    setState(() {});
  }
}
