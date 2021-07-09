import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Exercisecard extends StatelessWidget {
    Function changedata;
    int index1;
 // Exercisecard({required this.changedata});
   dynamic exercise;
   Exercisecard({this.exercise,required this.changedata,required this.index1});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:EdgeInsets.only(top: 8.0),
      child: Card(
          child: Column(
            children: [
              Center(child:Text(exercise.title)),
              Text(exercise.description,maxLines: 10,),
              Text('${exercise.calorieperhrs}') , 
               // ignore: deprecated_member_use
               FlatButton.icon(
             icon: Icon(Icons.print),
             label: Text('Save the \n changes'),
             onPressed:()//async
             { //await _auth.signOut();
            // Dayobject editob1=Dayobject(whichday:whichday,breakfast:breakfast,lunch: lunch,teatime: teatime,dinner:dinner,calorie:calorie,tip:tip);
              // print(ob1.calorie);
              // print(editob1.dinner);
               changedata(index1,23);
             }, 
             ),        
            ],
          ),
      ),
    );
  }
}