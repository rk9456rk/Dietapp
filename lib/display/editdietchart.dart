import 'package:dietapp/decoration/Mystyle.dart';
import 'package:dietapp/decoration/inputdec.dart';
import 'package:dietapp/objects/dietchart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditDayChart extends StatefulWidget {
  dynamic ob1;
  int index1;
  Function editfuncdiet;
  EditDayChart ({required this.ob1,required this.editfuncdiet,required this.index1});
  @override
  _EditDayChartState createState() => _EditDayChartState(ob1:ob1,index1:index1);
}

class _EditDayChartState extends State<EditDayChart> {
 // final Dayobject ob1=Dayobject(whichday: 'not dei',breakfast: 'bread ',lunch: 'rice',teatime: 'biscuit',dinner:'roti',calorie:2000.0,tip:'do exercise');
 int index1;
 dynamic ob1;
  _EditDayChartState({required this.ob1,required this.index1});

  final _formkey=GlobalKey<FormState>();
   late String whichday=ob1.whichday;
  late String breakfast=ob1.breakfast;
  late String lunch=ob1.lunch;
  late  String teatime=ob1.teatime;
  late  String dinner=ob1.dinner;
  late  String tip=ob1.tip;
  late  double calorie=ob1.calorie;
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
             child:Form(
                key:_formkey,
                            child: Column(

                  
                 children: <Widget>[
                   Text('edit the Chart',
                  style:  TextStyle(fontSize:  15.0)),
                  SizedBox(height: 20.0),
                   
                Center(child:Text('${ob1.whichday}',style: mystylewithsize)),
                   SizedBox(height:10.0),
                   
                       Row(
                     children: [
                        Expanded(
                          flex: 1,
                          child: Text('Breakfast : ',style: mystyle)),
                       Expanded(
                         flex: 2,
                         child: TextFormField(
                                    initialValue: ob1.breakfast,
                                   // decoration:textInputDecoration.copyWith(hintText: 'lunch'),
                                    validator:(val)=>val!.isEmpty?'Enter the dish':null,
                                    onChanged: (val)
                                    {
                                      setState(()=>breakfast=val);
                                    },
                                  ),
                       ),
                     ],
                   ),
                   
                   
                  
                   SizedBox(height:10.0),

                    Row(
                     children: [
                        Expanded(
                          flex: 1,
                          child: Text('Lunch : ',style: mystyle)),
                       Expanded(
                         flex: 2,
                         child: TextFormField(
                                    initialValue: ob1.lunch,
                                   // decoration:textInputDecoration.copyWith(hintText: 'lunch'),
                                    validator:(val)=>val!.isEmpty?'Enter the dish':null,
                                    onChanged: (val)
                                    {
                                      setState(()=>lunch=val);
                                    },
                                  ),
                       ),
                     ],
                   ),
                   //Text('lunch : ${ob1.lunch}'),
                   SizedBox(height:10.0),
                    Row(
                     children: [
                        Expanded(
                           flex: 1,child: Text('Teatime : ',style: mystyle)),
                       Expanded(
                          flex: 2,
                         child: TextFormField(
                                    initialValue: ob1.teatime,
                                   // decoration:textInputDecoration.copyWith(hintText: 'teatime'),
                                    validator:(val)=>val!.isEmpty?'Enter the dish':null,
                                    onChanged: (val)
                                    {
                                      setState(()=>teatime=val);
                                    },
                                  ),
                       ),
                     ],
                   ),
                  
                 // Text('Dinner : ${ob1.dinner}'),
                   SizedBox(height:10.0),
                  Row(
                     children: [
                        Expanded(
                           flex: 1,child: Text('Dinner : ',style: mystyle)),
                       Expanded( flex: 2,
                         child: TextFormField(
                                    initialValue: ob1.dinner,
                                    //decoration:textInputDecoration.copyWith(hintText: 'lunch'),
                                    validator:(val)=>val!.isEmpty?'Enter the dish':null,
                                    onChanged: (val)
                                    {
                                      setState(()=>dinner=val);
                                    },
                                  ),
                       ),
                     ],
                   ),
                  // Text('Teatime : ${ob1.teatime}'),
                   SizedBox(height:10.0),
                   Row(
                     children: [
                        Expanded(
                          flex: 1,child: Text('Tips : ',style: mystyle)),
                      Expanded(
                         flex: 2,
                         child: TextFormField(
                                    initialValue: ob1.tip,
                                   // decoration:textInputDecoration.copyWith(hintText: 'tips'),
                                    validator:(val)=>val!.isEmpty?'Enter the tips':null,
                                    onChanged: (val)
                                    {
                                      setState(()=>tip=val);
                                    },
                                  ),
                       ),
                     ],
                   ),       
                   //Text('tip : ${ob1.tip}'),
                   SizedBox(height:10.0),
                   
                   Text('calorie needed : ${ob1.calorie}',style: mystyle),
                   SizedBox(height:10.0),
                    // ignore: deprecated_member_use
                    FlatButton.icon(
             icon: Icon(Icons.print),
             label: Text('Save the \n changes'),
             onPressed:()//async
             { //await _auth.signOut();
             Dayobject editob1=Dayobject(whichday:whichday,breakfast:breakfast,lunch: lunch,teatime: teatime,dinner:dinner,calorie:calorie,tip:tip);
              widget.editfuncdiet(index1,editob1);
               print(ob1.calorie);
               print(editob1.dinner);
             }, 
             ),
               ],
               ),
             ),
              
          ),
        
      ), 
      
    );
  }
}