//import 'package:firefluterrk1/services/auth.dart';
//import 'package:firefluterrk1/shared/contants.dart';
import 'package:dietapp/decoration/Mystyle.dart';
import 'package:dietapp/dataused/datafiles.dart';
import 'package:dietapp/decoration/inputdec.dart';
import 'package:dietapp/services/auth.dart';
import 'package:dietapp/services/ser_object.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
   final Function toggleview;
  Register({required this.toggleview});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth= AuthService();
  final _formkey=GlobalKey<FormState>();
   bool loading =false;
  String email ='';
  String password='';
  String error='';
   final List<String> genderl=['female','male','other'];
  final List<String> foodl=['veg','nonveg'];
  final List<Objectlist> activityl=funcObjectlist();
  late String _currentname;
  late String _gender;
  late bool _foodtype;
  late double height;
  late double weight;
  late int age;
  //late double _leanfac;
  late double _activity;
  UserInformation ob1=UserInformation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.0,
        title: Text('register to app ' ),
         actions:<Widget>[
           // ignore: deprecated_member_use
           FlatButton.icon(
           icon: Icon(Icons.person),
           label: Text('Sign in'),
           onPressed:()async
           { widget.toggleview();
           //  await   _auth.signOut();
           }, 
           ),
         ],
      ),
  body:Container(
      decoration: BoxDecoration(
             
             image: DecorationImage(
               image: AssetImage('assets/FoodBack.png'),
               fit: BoxFit.cover,
              // matchTextDirection: 
             ),
             // ignore: deprecated_member_use
            //child :Text('Diet app'),
           ),
      child: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 50.0),
             // ignore: deprecated_member_use
             child: Form(
               key: _formkey,
               child: Column(
                 children: <Widget>[
                   
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:textInputDecoration.copyWith(hintText: 'Email'),
                          validator:(val)=>val!.isEmpty?'Enter the email':null,
                          onChanged: (val)
                          {
                            setState(()=>email=val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:textInputDecoration.copyWith(hintText: 'password'),
                          obscureText: true,
                           validator:(val)=>val!.length<6?'Enter the passeord atleast 6 character':null,
                          onChanged: (val)
                          {
                            setState(()=>password=val);
                          },
                        ),
                        SizedBox(height: 20.0),
                         Text('Fill the form ',
                    style:  mystylewithsize),
                    SizedBox(height: 20.0),
                     TextFormField(
                                //initialValue: userData.name,
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
                      //value:_gender??'not entered',
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
                      //value:_gender??'not entered',
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
                                //initialValue: userData.name,
                                decoration:textInputDecoration.copyWith(hintText: 'age'),
                                validator:(val)=>val!.isEmpty?'Enter the age':null,
                                onChanged: ( val)
                                {
                                  setState(()=>age=int.parse(val));
                                },
                               ),
                                SizedBox(height: 20.0),
                    TextFormField(
                                //initialValue: userData.name,
                                decoration:textInputDecoration.copyWith(hintText: 'height in cm'),
                                validator:(val)=>val!.isEmpty?'Enter the height':null,
                                onChanged: ( val)
                                {
                                  setState(()=>height=double.parse(val));
                                },
                              ),
                               SizedBox(height: 20.0),
                      TextFormField(
                                //initialValue: userData.name,
                                decoration:textInputDecoration.copyWith(hintText: 'weight in kg'),
                                validator:(val)=>val!.isEmpty?'Enter the weight':null,
                                onChanged: ( val)
                                {
                                  setState(()=>weight=double.parse(val));
                                },
                              ),

                     SizedBox(height: 20.0),
                     
                            DropdownButtonFormField(
                            decoration: textInputDecoration.copyWith(hintText: 'Activity'),
                            //value:_gender??'not entered',
                            //maxLines: 1,
                            style:TextStyle(fontSize:10.0,color: Colors.black,
                            fontWeight:FontWeight.bold),
                            items: activityl.map((ac1){
                              return DropdownMenuItem(
                                         value: ac1.value,
                                         child: Text('${ac1.text}')
                              );
                            }).toList(),
                            onChanged: (val){
                              //if(val!=null)
                              setState(()=>_activity=double.parse(val.toString())); }
                            ),
                          
                      
                      SizedBox(height: 20.0),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.orange[600],
                           child: Text('register ',style:TextStyle(color:Colors.white)),
                           onPressed:() async{

                             setState((){loading=true;
                             ob1.updateuserinformation(_currentname, _gender, _foodtype, height, weight, age, _activity);
                             
                             
                             });
                            if(_formkey.currentState!.validate())
                            {dynamic result=await _auth.registerwithemailandpassword(email, password,ob1);
                                  if(result==null)
                                  { setState((){ 
                                    error='please provide valid password and password';
                                    loading=false;
                                  });
                                 }  
                                 else
                                 print('registered') ; 
                            }  
                           }
                        ),
                        SizedBox(height: 20.0),
                        Text(error,style: TextStyle(fontSize:15.0,fontWeight:FontWeight.bold,color: Colors.red)),

                        SizedBox(height: 20.0),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.red[600],
                           child: Text('anon ',style:TextStyle(color:Colors.white)),
                           onPressed:() async{
                             setState(()=>loading=true);
                            if(_formkey.currentState!.validate())
                            {dynamic result=await _auth.signInAnon();
                                  if(result==null)
                                  { setState((){ 
                                    error='please did not sign in anon';
                                    loading=false;
                                  });
                            }    
                            }  
                           }
                        ),
                     ],
                   ),
             ),
               
             ),
      ),
      ),
      );
    
  }
}

