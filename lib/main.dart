//@dart=2.9

import 'package:dietapp/screen/authecation/authication.dart';
import 'package:dietapp/screen/createdietchart.dart';
import 'package:dietapp/screen/decidepage.dart';
import 'package:dietapp/services/auth.dart';
import 'package:dietapp/services/ser_object.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/Home/home.dart';
//import 'package:provider/provider.dart';
void main()=>runApp(MyApp());
/*

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return //StreamProvider.value(
           //value :AuthService().user,
          // child:
            MaterialApp(

        home: Home(),
      );
  }
}
*/
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
           value :AuthService().user,
           initialData: null,
           child: MaterialApp(

        home: Decidepage(),
      ),
    );
  }
}