/*import 'package:dietapp/decoration/inputdec.dart';
import 'package:flutter/material.dart';

class Drop1d extends StatefulWidget {
  @override
  _Drop1dState createState() => _Drop1dState();
}

class _Drop1dState extends State<Drop1d> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
                decoration: textInputDecoration.copyWith(hintText: hinttext),
                value:_currentsugar??userData.sugar,
                items: sugar.map((gender1){
                  return DropdownMenuItem(
                             value: sugar,
                             child: Text('$gender1')
                  );
                }).toList(),
                onChanged: (val)=> setState(()=>_currentsugar=val)
                );
  }
}

DropdownButtonFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Gender'),
                value:_currentsugar??userData.sugar,
                items: sugar.map((gender1){
                  return DropdownMenuItem(
                             value: sugar,
                             child: Text('$gender1')
                  );
                }).toList(),
                onChanged: (val)=> setState(()=>_currentsugar=val)
                )
                */