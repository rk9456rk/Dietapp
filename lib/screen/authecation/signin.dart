
import 'package:dietapp/decoration/inputdec.dart';
import 'package:dietapp/screen/authecation/register.dart';
import 'package:dietapp/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleview;
  SignIn({required this.toggleview});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //final funtion.toggleview;
  //SignIn({this.toggleview})
  final _formkey=GlobalKey<FormState>();
  final AuthService _auth= AuthService();
  bool loading =false;
  String email ='';
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.green,
      //image: AssetImage('assets/FoodBack.png'),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.0,
        title: Text('Sign app ANon ' ),
          actions:<Widget>[
           // ignore: deprecated_member_use
           FlatButton.icon(
           icon: Icon(Icons.person),
           label: Text('register'),
           onPressed:()async
           { 
             
           widget.toggleview();

           
             /*print('iiiii');
               Navigator.of(context).push(
                 MaterialPageRoute(
                   builder:(context)=>Register()
                 )
               );
               */    
           }, 
           ),
         ],
      ),
      body:Container(
         // margin: AssetImage('assets/FoodBack.png'),
         decoration: BoxDecoration(
             
             image: DecorationImage(
               image: AssetImage('assets/FoodBack.png'),
               fit: BoxFit.cover,
              // matchTextDirection: 
             ),
             // ignore: deprecated_member_use
            //child :Text('Diet app'),
           ),
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
                        decoration:textInputDecoration.copyWith(hintText: 'password'),//errorStyle: myerror1),
                         //errorStyle: myerror1,
                         validator:(val)=>val!.length<6?'Enter the passeord atleast 6 character':null,
                        obscureText: true,
                        onChanged: (val)
                        {
                          setState(()=>password=val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        color: Colors.orange[600],
                         child: Text('signin ',style:TextStyle(color:Colors.white)),
                         onPressed:() async{
                           setState(()=>loading=true);
                            if(_formkey.currentState!.validate())
                          {dynamic result=await _auth.signinwithemailandpassword(email,password);
                               if(result==null)
                               { setState((){ 
                                 error='could not signIn ';
                                 loading =false;
                                });
                                                    
                               }
                               else
                               print('signed in');

                          } 
                         } ,     

                      ),
                      SizedBox(height: 20.0),
                      Text(error,style: TextStyle(fontSize:15.0,fontWeight:FontWeight.bold,color: Colors.red)),
                   ],
                 ),
           ),
             
           ),
      ),
      );
    
  }
}