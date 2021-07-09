import 'package:dietapp/dataused/datafiles.dart';
import 'package:dietapp/decoration/inputdec.dart';
import 'package:dietapp/objects/forhomescreen.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class Exoptionform extends StatefulWidget {
  Function delete;
  Function assignment;
  List<Homeexercise>  exerciselist1;
   Exoptionform({required this.exerciselist1,required this.delete,required this.assignment});
  @override
  _ExoptionformState createState() => _ExoptionformState(exerciselist1:exerciselist1 );
}

class _ExoptionformState extends State<Exoptionform> {
  List<Homeexercise>  exerciselist1;
  final List<Homeexercise> e11=funclistexercise();
  _ExoptionformState({required this.exerciselist1});
  late double calpermin=0;
  late int val11=0;
  late int time11=0;
  late bool ontapdone=false; 
  @override
  Widget build(BuildContext context) {
    return Card(
      color:Colors.amber[200],
      child: Column(
        children: [
           DropdownButtonFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Exercise'),
                    
                    items:e11.map((food1){
                      return DropdownMenuItem(
                                 value: food1.calorieperhrs,
                                 child: Text(food1.title)
                      );
                    }).toList(),
                    onChanged: (val){
                         setState(()=>calpermin= int.parse(val.toString())/60);
                            print(calpermin);
                                  }              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                                    
                                    decoration:textInputDecoration.copyWith(hintText: 'time in minutes'),
                                    validator:(val)=>val!.isEmpty?'Enter the time':null,
                                    onChanged: ( val)
                                    {
                                      setState(()=>time11=int.parse(val));
                                    },
                                  ),
                  ),
                  Expanded(
                    flex :1,
                    child: SizedBox(width:10.0),
                  )
                ],
              ), 
           
          // ignore: deprecated_member_use
          Row(
            children: [
              Expanded(
                flex:2,
                // ignore: deprecated_member_use
                child: FlatButton.icon(
                                //if(ontapdone)
                              // color: Colors.green,
                             //  else
                                color: ontapdone?Colors.green : Colors.white,    
                              //highlightColor: Colors.green, 
                              //focusColor:Colors.red,
                              //onHighlightChanged:Colors.blue ,
                               icon: Icon(Icons.done,
                                       size:30),
                               
                               label: Text('Done'),
                               onPressed:()//async
                               { //await _auth.signOut();
                                       print('iiiii');
                                       
                                 setState((){
                                   ontapdone=true;
                                   val11=(calpermin*time11).toInt();
                                   widget.assignment(val11);
                                 });
                               }, 
                               ),
              ),
               Expanded(
                flex :1,
                child: SizedBox(width: 10.0,),
                               ),                
              Expanded(
                flex: 2,
                // ignore: deprecated_member_use
                child: FlatButton.icon(
                               icon: Icon(Icons.close,size:30),
                               
                               label: Text('delete this \n activity'),
                               onPressed:()//async
                               { //await _auth.signOut();
                                       print('iiiii');
                                 setState(()=>widget.delete());
                               }, 
                               ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}