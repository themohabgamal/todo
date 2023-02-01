import 'package:flutter/material.dart';

class dialogUtils {
  static void showWaitingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 15,
              ),
              Text(message)
            ],
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  static void endWaitingDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void messageDialog(BuildContext context, String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction}) {
    showDialog(
      context: context,
      builder: (buildContext) {
        List<Widget>action=[];
        if(posActionTitle!=null){
          action.add(TextButton(onPressed: (){
            Navigator.pop(context);
            if(posAction!= null){
              posAction();
            }
          }, child: Text(posActionTitle)));
        }
        if(negActionTitle!=null){
          action.add(TextButton(onPressed: (){
            Navigator.pop(context);
            if(negAction!=null){
              negAction();
            }
          }, child: Text(negActionTitle)));
        }
        return AlertDialog(
          content: Text(message),
          actions: action,
        );
      },
    );
  }
}
