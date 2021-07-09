import 'package:dietapp/dataused/datafiles.dart';
import 'package:dietapp/decoration/Mystyle.dart';
import 'package:dietapp/display/Exoptionform.dart';
import 'package:dietapp/objects/excercisecardcal.dart';
import 'package:dietapp/objects/forhomescreen.dart';
import 'package:flutter/material.dart';

class CalExercise extends StatefulWidget {
  

  @override
  _CalExerciseState createState() => _CalExerciseState();
}

class _CalExerciseState extends State<CalExercise> {
  List<Homeexercise>  exerciselist1= funclistexercise();
  List<Exoptioncard>  exmanage=[];
  late int total=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
               title: Text('calculate calorie burn'),
               backgroundColor: Colors.amber,
               elevation : 0.0,
               actions: [
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                       icon: Icon(Icons.check_box,size:30),
                       
                       label: Text('$total \n kcal'),
                       onPressed:()//async
                       { //await _auth.signOut();
                               print('iiiii');
                         
                       }, 
                       ),

               ],
             ),
      body: Container(
         decoration: BoxDecoration(
             
             image: DecorationImage(
               image: AssetImage('assets/excercise1.png'),
               fit: BoxFit.cover,
              // matchTextDirection: 
             ),
             // ignore: deprecated_member_use
            //child :Text('Diet app'),
            //child: Text(' gg'),
           ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:30.0),
              Center(child: Text('$total  kcal burn',style:myaccountstyle)),
              Container(
                child: Column(
                  children: exmanage.map((ele)=>Exoptionform(exerciselist1:exerciselist1,
                   delete:(){setState((){ total=total-ele.prevval; exmanage.remove(ele);});}
                   ,assignment:(int val11){ 
                     setState((){total=total+val11-ele.prevval;
                     ele.prevval=val11; }
                     ); 
                        }
                   
                  )).toList(),
                ),
              ),
              //return Exoptionform(exerciselist1:exerciselist1);
              Container(
                color: Colors.amber,
              
                // ignore: deprecated_member_use
                child: FlatButton.icon(
                       icon: Icon(Icons.add,size:30),
                       
                       label: Text('add a new \n activity'),
                       onPressed:()//async
                       { //await _auth.signOut();
                               print('iiiii');
                         setState(()=>exmanage.add(Exoptioncard(prevval:0)));
                       }, 
                       ),
              ),
              SizedBox(height:280.0),
              
            ],
          ),
        ),
      )
    );
  }
}