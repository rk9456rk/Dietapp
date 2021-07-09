import 'dart:io';

import 'package:dietapp/dataused/datafiles.dart';
import 'package:dietapp/display/calexecercise.dart';
import 'package:dietapp/display/exercisecard.dart';
import 'package:dietapp/objects/forhomescreen.dart';
import 'package:flutter/material.dart';
/*
Future<String> returnfile( ) 
async { String contents = await new File('exercise.txt').readAsString();
  print('File Contents\n---------------');
 // print(contents);
  return contents;
  //return contents;
 // contents.then((value)=>ans=value);
}*/
List<int> lint1=[1,2,3,4,5];
class Disexcercise extends StatefulWidget {
  
  void changedata(int index1,int value1)
  { lint1[index1]=value1;

  }

  @override
  _DisexcerciseState createState() => _DisexcerciseState(changedata:changedata);
}

class _DisexcerciseState extends State<Disexcercise> {

   final Function changedata;
  _DisexcerciseState({required this.changedata});
  @override
  Widget build(BuildContext context)  {
   // var contents = File('resources/file.txt').readAsStringSync();
 // print('File Contents\n---------------');
 // print(contents);
     List<Homeexercise>  exerciselist1= funclistexercise();
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise list'),
               backgroundColor: Colors.amber,
               elevation : 0.0,
      actions:<Widget>[
                 // ignore: deprecated_member_use
                  FlatButton.icon(
                 icon: Icon(Icons.print),
                 label: Text('print list'),
                 onPressed:()//async
                 { //await _auth.signOut();
                         print(lint1);
                   
                 }, 
                 ),
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                 icon: Icon(Icons.calculate_sharp),
                 label: Text('calculate'),
                 onPressed:()//async
                 { //await _auth.signOut();
                         print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>CalExercise()
                     )
                   );
                 }, 
                 ),
                
                 
               ],         
      ),
      body: Container(
          child: ListView.builder(
         itemCount: exerciselist1.length,
         itemBuilder: (context,index)
         { //return PerDayChart(ob1: obj1.day[index]);
              return Exercisecard(exercise:exerciselist1[index],changedata:changedata,index1:index);
         },
      ),
      ),

    );
  }
}