import 'package:dietapp/decoration/inputdec.dart';
import 'package:dietapp/services/auth.dart';
import 'package:dietapp/services/ser_object.dart';
import 'package:flutter/material.dart';
import 'package:dietapp/dataused/datafiles.dart';
//import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Settinfform  extends StatefulWidget {
  @override
   dynamic userDataobj;
   Settinfform({this.userDataobj});
 
  _SettinfformState createState() => _SettinfformState(userDataobj:userDataobj);
}

class _SettinfformState extends State<Settinfform> {
   dynamic userDataobj;
   _SettinfformState({this.userDataobj});
  final _formkey=GlobalKey<FormState>();
  final List<String> genderl=['female','male','other'];
  final List<String> foodl=['veg','nonveg'];
  final List<Objectlist> activityl=funcObjectlist();
  late String _currentname=userDataobj.ob1.name;
  late String _gender=userDataobj.ob1.gender;
  late bool _foodtype=userDataobj.ob1.foodtype;
  late double height=userDataobj.ob1.height;
  late double weight=userDataobj.ob1.weight;
  late int age=userDataobj.ob1.age;
  //late double _leanfac;
  Map <double,int> mp11={1.3:0,1.55:1,1.65:2,1.8:3,2.0:4};
  //int? sin12=mp11[userDataobj.ob1.activity];
  late double _activity=userDataobj.ob1.activity;
  //dynamic userDataobj;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
             
             image: DecorationImage(
               image: AssetImage('assets/foodset.png'),
               fit: BoxFit.cover,
              // matchTextDirection: 
             ),
             // ignore: deprecated_member_use
            //child :Text('Diet app'),
           ),
      child: SingleChildScrollView(
            child: Form(
              key :_formkey,
              child: Column(
                children: <Widget>[
                  Text('update the setting',
                  style:  TextStyle(fontSize:  20.0)),
                  SizedBox(height: 20.0),
                   TextFormField(
                              initialValue: userDataobj.ob1.name,
                              decoration:textInputDecoration.copyWith(hintText: 'name'),
                              validator:(val)=>val!.isEmpty?'Enter the name':null,
                              onChanged: (val)
                              {
                                setState(()=>_currentname=val);
                              },
                            ),
                  SizedBox(height: 20.0),
                  // drop down
                  DropdownButtonFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Gender'),
                   // if(_gender==null)
                    value:userDataobj.ob1.gender, 
                    items: genderl.map((gender1){
                      return DropdownMenuItem(
                                 value: gender1,
                                 child: Text('$gender1')
                      );
                    }).toList(),
                    onChanged: (val){setState(()=>_gender=val.toString()); }
                    ),
                     SizedBox(height: 20.0),
                   DropdownButtonFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'veg or nonveg'),
                    value:foodl[userDataobj.ob1.foodtype?0:1],
                    items: foodl.map((food1){
                      return DropdownMenuItem(
                                 value: food1,
                                 child: Text('$food1')
                      );
                    }).toList(),
                    onChanged: (val){
                       if(val== foodl[0])
                       setState(()=>_foodtype=true);
                       else
                       setState(()=>_foodtype=false);

                                  }              ),
                  //slider 
                  SizedBox(height: 20.0),
                  TextFormField(
                              initialValue: '${userDataobj.ob1.age}',
                              decoration:textInputDecoration.copyWith(hintText: 'age'),
                              validator:(val)=>val!.isEmpty?'Enter the age':null,
                              onChanged: ( val)
                              {
                                setState(()=>age=int.parse(val));
                              },
                             ),
                              SizedBox(height: 20.0),
                  TextFormField(
                              initialValue: '${userDataobj.ob1.height}',
                              decoration:textInputDecoration.copyWith(hintText: 'height in cm'),
                              validator:(val)=>val!.isEmpty?'Enter the height':null,
                              onChanged: ( val)
                              {
                                setState(()=>height=double.parse(val));
                              },
                            ),
                             SizedBox(height: 20.0),
                    TextFormField(
                              initialValue: '${userDataobj.ob1.weight}',
                              decoration:textInputDecoration.copyWith(hintText: 'weight in kg'),
                              validator:(val)=>val!.isEmpty?'Enter the weight':null,
                              onChanged: ( val)
                              {
                                setState(()=>weight=double.parse(val));
                              },
                            ),

                   SizedBox(height: 20.0),
                    DropdownButtonFormField(
                    decoration: InputDecoration(
                        hintText: 'Activity', //usecopywtih(hint: 'Email')
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
                                  
                      ),
                    //maxLines:1,
                    //value:activityl[0],
                    style:TextStyle(fontSize:13.0,color: Colors.black),
                    items: activityl.map((ac1){
                      return DropdownMenuItem(
                                 value: ac1.value,
                                 
                                 child: Text('${ac1.text}',maxLines:2)
                      );
                    }).toList(),
                    onChanged: (val){
                      //if(val!=null)
                      setState(()=>_activity=double.parse(val.toString())); }
                    ),
                    SizedBox(height: 20.0),
                    
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.green,
                    child: Text('Update',style:TextStyle( color: Colors.white)),
             
                    onPressed: () async{
                      if(_formkey.currentState!.validate())
                      {
                        print( _currentname);
                 print( _gender);
                               print(_foodtype);
                        print(height);
                           print(weight);
                              print(age);
                              print(_activity);
                        UserInformation userinfo12=UserInformation();      
                        userinfo12.updateuserinformation(_currentname, _gender, 
                        _foodtype, height, 
                        weight, age, _activity);
                       userDataobj.ob1=userinfo12; 
                         await AuthService().updatadirectbyobj(userDataobj);     
                        Navigator.pop(context);

                      }
                      else
                      print('not enter');
                      },
                    )
                ],
              ),
              
            ),
      ),
    );
  }
}