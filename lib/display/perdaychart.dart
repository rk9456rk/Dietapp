import 'package:dietapp/decoration/Mystyle.dart';
import 'package:dietapp/objects/dietchart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PerDayChart extends StatelessWidget {
 // final Dayobject ob1=Dayobject(whichday: 'not dei',breakfast: 'bread ',lunch: 'rice',teatime: 'biscuit',dinner:'roti',calorie:2000.0,tip:'do exercise');
  dynamic ob1;
  PerDayChart({required this.ob1});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top: 8.0),
      child: Card(
        
        margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
        color: Colors.green,
        child: Container(
           decoration: BoxDecoration(
             
             image: DecorationImage(
               image: AssetImage('assets/chartback.png'),
               fit: BoxFit.cover,
              // matchTextDirection: 
             ),
             // ignore: deprecated_member_use
            //child :Text('Diet app'),
           ),
           child: Column(

              
             children: <Widget>[
              
                 Row(
                   children: [
                     Expanded( flex: 2,
                     child: Text(' ',style: mystyle1)
                     ),
                     Expanded(
                       flex: 5,
                       child: Text('${ob1.whichday}',style: mystylewithsize)),
                   ],
                 ),
                 
               SizedBox(height:15.0),
               Row(
                 children: [
                   Expanded( flex: 1,
                     child: Text(' ',style: mystyle1)
                     ),
                     Expanded(flex: 1,
                     child: Text('Breakfast ',style: mystyle1)
                     ),
                     Expanded( flex:3,
                     child: Text(': ${ob1.breakfast}',style: mystyle1)
                     ),
                 ],
               ),
               SizedBox(height:10.0),
               Row(
                 children: [
                   Expanded( flex: 1,
                     child: Text(' ',style: mystyle1)
                     ),
                     Expanded(flex: 1,
                     child: Text('Lunch ',style: mystyle1)
                     ),
                     Expanded( flex:3,
                     child: Text(': ${ob1.lunch}',style: mystyle1)
                     ),
                 ],
               ),
              // Text('lunch : ${ob1.lunch}',style: mystyle1),
               SizedBox(height:10.0),
               Row(
                 children: [
                   Expanded( flex: 1,
                     child: Text(' ',style: mystyle1)
                     ),
                     Expanded(flex: 1,
                     child: Text('Dinner ',style: mystyle1)
                     ),
                     Expanded( flex:3,
                     child: Text(': ${ob1.dinner}',style: mystyle1)
                     ),
                 ],
               ),
               //Text('Dinner : ${ob1.dinner}',style: mystyle1),
               SizedBox(height:10.0),
               Row(
                 children: [
                   Expanded( flex: 1,
                     child: Text(' ',style: mystyle1)
                     ),
                     Expanded(flex: 1,
                     child: Text('Teatime ',style: mystyle1)
                     ),
                     Expanded( flex:3,
                     child: Text(': ${ob1.teatime}',style: mystyle1)
                     ),
                 ],
               ),
              // Text('Teatime : ${ob1.teatime}',style: mystyle1),
               SizedBox(height:10.0),
               Row(
                 children: [
                   Expanded( flex: 1,
                     child: Text(' ',style: mystyle1)
                     ),
                     Expanded(flex: 1,
                     child: Text('Tips ',style: mystyle1)
                     ),
                     Expanded( flex:3,
                     child: Text(': ${ob1.tip}',style: mystyle1)
                     ),
                 ],
               ),
              // Text('tip : ${ob1.tip}',style: mystyle1),
               SizedBox(height:10.0),
               Row(
                 children: [
                   Expanded( flex: 1,
                     child: Text(' ',style: mystyle1)
                     ),
                     Expanded(flex: 1,
                     child: Text('Calorie ',style: mystyle1)
                     ),
                     Expanded( flex:3,
                     child: Text(': ${ob1.calorie}',style: mystyle1)
                     ),
                 ],
               ),
              // Text('calorie : ${ob1.calorie}',style: mystyle1),
               SizedBox(height:10.0),
           ],
           ),
            
        ),
      ), 
      
    );
  }
}