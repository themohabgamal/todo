import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/myTheme.dart';
import 'package:todo/firebase/Task.dart';
import 'package:todo/firebase/myDataBase.dart';
import 'package:todo/utils/dateUtils.dart';
import 'package:todo/utils/dialogUtils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class taskBottomSheetBuilder extends StatefulWidget {
  @override
  State<taskBottomSheetBuilder> createState() => _taskBottomSheetBuilderState();
}

class _taskBottomSheetBuilderState extends State<taskBottomSheetBuilder> {
  var titleController=TextEditingController();
  var descController=TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 11),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.addNewTask,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(textStyle: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 22, fontWeight: FontWeight.w500)),),
            TextFormField(
              style: GoogleFonts.montserrat(textStyle: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
              controller: titleController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return AppLocalizations.of(context)!.titleError;
                }
                return null;
              },
              decoration: InputDecoration(labelText: AppLocalizations.of(context)!.taskTitle,labelStyle: GoogleFonts.montserrat(textStyle: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontSize: 19, fontWeight: FontWeight.w500)),)
            ),
            TextFormField(
              style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.w400),
              controller: descController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return AppLocalizations.of(context)!.descError;
                }
                return null;
              },
              maxLines: 3,
              minLines: 3,
              decoration: InputDecoration(labelText:AppLocalizations.of(context)!.taskDesc,labelStyle: GoogleFonts.montserrat(textStyle: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontSize: 19, fontWeight: FontWeight.w500)),),
            ),
            SizedBox(
              height: 10,
            ),
            Text(AppLocalizations.of(context)!.selectDate,
                style: GoogleFonts.montserrat(textStyle: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 22, fontWeight: FontWeight.w500)),
                ),
            InkWell(
                onTap: () {
                  showTaskDatePicker();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    myDateUtils.dateFormater(selectedDate),
                    style: GoogleFonts.cairo(
                        textStyle: GoogleFonts.montserrat(textStyle: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: 19, fontWeight: FontWeight.w500))
                            ),
                  ),
                )),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                insertTask();
              },
              child: Text(
                AppLocalizations.of(context)!.submit,
                style: TextStyle(fontSize: 22),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: myTheme.teal),
            )
          ],
        ),
      ),
    );
  }

  var selectedDate = DateTime.now();
  void showTaskDatePicker() async {
    var userSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          Duration(days: 365),
        ));
    if (userSelectedDate == null) {
      return;
    }
    setState(() {
      selectedDate = userSelectedDate;
    });
  }

  void insertTask() async{
    // validate
    if (formKey.currentState?.validate() == false) {
      return;
    }
    // insert task into database
    Task task=Task( title: titleController.text, description: descController.text, dateTime: selectedDate);
    dialogUtils.showWaitingDialog(context,AppLocalizations.of(context)!.addingTask);
    await myDataBase.insertTask(task);
    dialogUtils.endWaitingDialog(context);
    dialogUtils.messageDialog(context,AppLocalizations.of(context)!.taskWasAdded,posActionTitle: "Ok",posAction: () {
      Navigator.pop(context);
    },);
  }

}
