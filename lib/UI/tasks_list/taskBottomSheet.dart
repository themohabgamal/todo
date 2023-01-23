import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/UI/myTheme.dart';

class taskBottomSheetBuilder extends StatefulWidget {

  @override
  State<taskBottomSheetBuilder> createState() => _taskBottomSheetBuilderState();
}

class _taskBottomSheetBuilderState extends State<taskBottomSheetBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Text("Add New Task",textAlign: TextAlign.center,style: GoogleFonts.cairo(textStyle: Theme.of(context).textTheme.headline5,)),
    TextFormField(
      decoration: InputDecoration(
        labelText: "Task Title"
      ),
    ),
    TextFormField(
      maxLines: 4,
      minLines: 4,
      decoration: InputDecoration(
        labelText: "Task Description"
      ),
    ),
    SizedBox(height: 15,),
    Text("Select date",style: GoogleFonts.cairo(textStyle: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 22,fontWeight: FontWeight.w500),)),
    InkWell(
        onTap: () {
          showTaskDatePicker();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("12/5/2023",style: GoogleFonts.cairo(textStyle: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black54)),),
        )),
    SizedBox(height: 8,),
    ElevatedButton(onPressed: (){}, child: Text("Submit",style: TextStyle(fontSize: 22),),style: ElevatedButton.styleFrom(backgroundColor: myTheme.teal),)
  ],
),
    );
  }

  void showTaskDatePicker() {
     showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365),

        ));
  }}
