import 'package:dietapp/display/editdietchart.dart';
import 'package:dietapp/display/perdaychart.dart';
import 'package:dietapp/objects/dietchart.dart';
import 'package:dietapp/services/auth.dart';

import 'package:flutter/material.dart';



// ignore: must_be_immutable
class EditChart extends StatefulWidget {
  dynamic userDataobj;
   EditChart({this.userDataobj});
   
  @override
  _EditChartState createState() => _EditChartState(userDataobj:userDataobj);
}

class _EditChartState extends State<EditChart> {
   dynamic userDataobj;
   _EditChartState({this.userDataobj});
   void editfuncdiet(int index1,Dayobject dayobjectpass)
   { userDataobj.userdiet.day[index1]=dayobjectpass;
     print(' update $index1');
   }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
         appBar: AppBar(
           title: Text(' Edit diet Chart'),
           backgroundColor: Colors.red,
           elevation : 0.0,
           actions:<Widget>[
             // ignore: deprecated_member_use
             FlatButton.icon(
             icon: Icon(Icons.save),
             label: Text('Save the \n changes'),
             onPressed:() async
             { //await _auth.signOut();
              await AuthService().updatadirectbyobj(userDataobj);
               Navigator.of(context).pop();
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
              return EditDayChart(ob1:userDataobj.userdiet.day[index],
                                  editfuncdiet:editfuncdiet,
                                  index1:index);
         },
      ),
          ),
    );
  }
}

