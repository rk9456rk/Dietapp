// for decoration
import 'package:flutter/material.dart';
// for decoration
const textInputDecoration= InputDecoration(
                        //hintText: 'Email', usecopywtih(hint: 'Email')
                        fillColor: Colors.lightBlueAccent,
                        filled : true,
                        enabledBorder: OutlineInputBorder(
                        borderSide :BorderSide(color:Colors.white,width :2.0),
                        
                        ),   
                         focusedBorder: OutlineInputBorder(
                        borderSide :BorderSide(color:Colors.pink,width :2.0),
                        
                        ),
                     //maxLines: 1,
                       // overflow:          
                      );