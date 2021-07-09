

import 'package:dietapp/decoration/myerrorstyle.dart';
import 'package:dietapp/screen/authecation/Accout.dart';
//import 'package:dietapp/screen/authecation/authication.dart';
import 'package:dietapp/screen/createdietchart.dart';
import 'package:dietapp/screen/settingform.dart';
import 'package:dietapp/services/database.dart';
import 'package:dietapp/services/ser_object.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homemy extends StatelessWidget {
   //final AuthService _auth= AuthService();
  @override
  Widget build(BuildContext context) {
    //final user=Provider.of<User>(context);
  // final AuthService _auth= AuthService();
      
          return Scaffold(
            backgroundColor: Colors.green,
             appBar: AppBar(
               title: Text('temp home to app'),
               backgroundColor: Colors.amber,
               elevation : 0.0,
               actions:<Widget>[
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                 icon: Icon(Icons.person),
                 label: Text('Account'),
                 onPressed:()//async
                 { //await _auth.signOut();
                         print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>Account()
                     )
                   );
                 }, 
                 ),
                 // ignore: deprecated_member_use
                 
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                 icon: Icon(Icons.file_present),
                 label: Text('Diet chart'),
                 onPressed:()
                 { print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>CreateChart()
                     )
                   );
                 }, 
                 ),
                 
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
           child:Column(
             children: [
               Row(
                 children: [
                   Expanded(child: Text('')),
                 ],
               ),
               Text('Diet app'),
             ],
           ),
      ),
          
          );
    
  }
}