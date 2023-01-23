import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/UI/myTheme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class taskBuilder extends StatelessWidget {
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
              onPressed: (context) {},
              icon: Icons.delete,
              foregroundColor: Colors.white,
              label: "Delete",
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
                          "First todo",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          "Description",
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Icon(Icons.check, color: Colors.white),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: myTheme.teal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
