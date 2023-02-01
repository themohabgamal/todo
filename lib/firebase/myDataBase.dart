import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/utils/dateUtils.dart';

import 'Task.dart';

class myDataBase{
   static CollectionReference<Task> getTasksCollection(){
  var tasksCollection=FirebaseFirestore.instance.collection('tasks').withConverter(fromFirestore: (snapshot, options) => Task.fromFireStore(snapshot.data()!)
      , toFirestore: (task, options) => task.toFireStore());
  return tasksCollection;
}
   static Future<void> insertTask(Task task) {
    var TaskCollection=getTasksCollection();
    var doc=TaskCollection.doc();
    task.id=doc.id;
    task.dateTime=myDateUtils.convertToDateOnly(task.dateTime);
    return doc.set(task);
  }
   static Future<List<Task>> readTask(DateTime dateTime)async{
     var querySnapshot=await getTasksCollection().where('DateTime',isEqualTo: myDateUtils.convertToDateOnly(dateTime).millisecondsSinceEpoch).get();
     var allTasksList =querySnapshot.docs.map((doc) => doc.data()).toList();
     return allTasksList;
  }
  static Stream<QuerySnapshot<Task>>getRealTimeUpdates(DateTime dateTime){
     return getTasksCollection().where('DateTime',isEqualTo: myDateUtils.convertToDateOnly(dateTime).millisecondsSinceEpoch).snapshots();
  }
  static Future<void> deleteTask(Task task){
     var taskToDelete=getTasksCollection().doc(task.id);
     return taskToDelete.delete();
  }


}