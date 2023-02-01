import 'package:intl/intl.dart';

class myDateUtils{
   static String dateFormater(DateTime dateTime){
     DateFormat formater=DateFormat("dd/MM/yyyy");
     return formater.format(dateTime);
   }
   static DateTime convertToDateOnly(DateTime dateTime){
     return DateTime(dateTime.year,dateTime.month,dateTime.day);
   }

}