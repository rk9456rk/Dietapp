import 'package:dietapp/screen/authecation/register.dart';
import 'package:dietapp/screen/authecation/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
   bool showsignin=true;
  void toggleview()
  { setState(()=> showsignin=!showsignin);

  }

  @override
  Widget build(BuildContext context) {
    
      
      if(showsignin)  return SignIn(toggleview: toggleview);
      else
      return Register(toggleview: toggleview);
    
  }
}