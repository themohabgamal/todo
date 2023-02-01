class Task{
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;
  Task({ this.id='',required this.title,required this.description,required this.dateTime,this.isDone=false});
  Map<String,dynamic> toFireStore(){
    return {
      'id':this.id,
      'title':this.title,
      'description':this.description,
      'DateTime':this.dateTime.millisecondsSinceEpoch,
      'isDone':this.isDone
    };
  }
  Task.fromFireStore(Map<String,dynamic> data):
    this(
      id:data['id'],
      title:data['title'],
      description:data['description'],
      dateTime:DateTime.fromMillisecondsSinceEpoch(data['DateTime']),
      isDone:data['isDone']
    );


}