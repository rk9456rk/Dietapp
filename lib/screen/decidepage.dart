
import 'package:dietapp/screen/authecation/authication.dart';
import 'package:dietapp/services/ser_object.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Home/home.dart';

class Decidepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    //  return Authenticate();
    if(user.uid=='not valid')
       return Authenticate();
    else
     return Home();     
  }
}
