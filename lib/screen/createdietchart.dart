import 'package:dietapp/display/perdaychart.dart';
import 'package:dietapp/objects/dietchart.dart';
import 'package:dietapp/screen/editchartcreate.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CreateChart extends StatefulWidget {
 dynamic userDataobj;
   CreateChart({this.userDataobj});
  @override
  _CreateChartState createState() => _CreateChartState(userDataobj:userDataobj);
}

class _CreateChartState extends State<CreateChart> {
   dynamic userDataobj;
   _CreateChartState({this.userDataobj});
 //  final bool isveg;
 //  _CreateChartState({required this.isveg});
  // bool toi=isveg;
    //dynamic obj1= await getdaychart();//=
    //
    // DietChart obj1=DietChart(foodtype:false);//.makechart();
  //obj1= getdaychart();
  //__CreateChartState({this.obj1});
  //static get isveg => null;
   
  @override
   
  Widget build(BuildContext context) {
    //DietChart obj1=DietChart(foodtype:false);
   // obj1.makechart();
    return Scaffold(
         appBar: AppBar(
           title: Text('Diet Chart'),
           backgroundColor: Colors.amber,
           elevation : 0.0,
           actions:<Widget>[
             // ignore: deprecated_member_use
             FlatButton.icon(
             icon: Icon(Icons.edit),
             label: Text('edit chart'),
             onPressed:()//async
             { //await _auth.signOut();
               print('iiiii');
               Navigator.of(context).push(
                 MaterialPageRoute(
                   builder:(context)=>EditChart(userDataobj:userDataobj)
                 )
               );
             }, 
             ),
             // ignore: deprecated_member_use
            
           ],
         ),
          
          body: Container(
            decoration: BoxDecoration(
             
             image: DecorationImage(
               image: AssetImage('assets/FoodBack.png'),
               fit: BoxFit.cover,
              // matchTextDirection: 
             ),
             // ignore: deprecated_member_use
            //child :Text('Diet app'),
           ),
            child: ListView.builder(
         itemCount: 7,
         itemBuilder: (context,index)
         { //return PerDayChart(ob1: obj1.day[index]);
              return PerDayChart( ob1: userDataobj.userdiet.day[index]);
         },
      ),
          ),
    );
  }
}
/*
class _CreatechartState extends State<Createchart> {
  //final DietChart obj1;
  //Createchart({this.obj1});
  final bool isveg;
  Createchart({this.isveg}); 
   DietChart obj1(isveg);
 // Createchart({this.obj1});
    obj1.makechart(foodtype);
  @override
  Widget build(BuildContext context) {
    // DietChart obj1;
 // Createchart({this.obj1});
  //  obj1.makechart(foodtype);
    return ListView.builder(
       itemCount: 7,
       itemBuilder: (context,index),
    );
  
  }
}
*/