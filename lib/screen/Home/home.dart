

import 'package:dietapp/decoration/Mystyle.dart';
import 'package:dietapp/decoration/myerrorstyle.dart';
import 'package:dietapp/display/discardinfo.dart';
import 'package:dietapp/objects/forhomescreen.dart';
import 'package:dietapp/screen/Home/disExercise.dart';
import 'package:dietapp/screen/authecation/Accout.dart';
//import 'package:dietapp/screen/authecation/authication.dart';
import 'package:dietapp/screen/createdietchart.dart';
import 'package:dietapp/services/database.dart';
import 'package:dietapp/services/ser_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
 class Home extends StatelessWidget {
   
 
   @override
     Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
  // final AuthService _auth= AuthService();
    return  StreamBuilder<Userdata>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData)
        { Userdata? userdataobj = snapshot.data;
           Weightobject weirange=findweightrange(userdataobj!.ob1.calBMI());
           bool ontapval=false;
          return Scaffold(
             backgroundColor: Colors.green,
             appBar: AppBar(
               title: Text('welcome to app'),
               backgroundColor: Colors.amber,
               elevation : 0.0,
               actions:<Widget>[
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                 icon: Icon(Icons.person),
                 label: Text('Account'),
                 onPressed:()//async
                 { //await _auth.signOut();
                         print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>Account(userDataobj:userdataobj)
                     )
                   );
                 }, 
                 ),
                 // ignore: deprecated_member_use
                /* FlatButton.icon(
                 icon: Icon(Icons.person),
                 label: Text('tem home'),
                 onPressed:()//async
                 { //await _auth.signOut();
                         print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>Homemy()
                     )
                   );
                 }, 
                 ),*/
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                 icon: Icon(Icons.file_present),
                 label: Text('Diet chart'),
                 onPressed:()
                 { print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>CreateChart(userDataobj:userdataobj )
                     )
                   );
                 }, 
                 ),
                 
               ],
             ),
           body :Container(
             decoration: BoxDecoration(
                   
                   image: DecorationImage(
                     image: AssetImage('assets/FoodBack.png'),
                     fit: BoxFit.cover,
                    // matchTextDirection: 
                   ),
                   
                  //child :Text('Diet app'),
                 ),
                     child: Container(
                          
                  child: Column(
                     
                    children: <Widget>[
                      Row(
                 children: [
                   Expanded(child: Text('')),
                 ],
               ),
                     SizedBox(height: 80.0),
                     Container(child: Text('${userdataobj.uid}',style:myerror1)),
                     Card( 
                       //margin:EdgeInsets.all(100.0),
                       margin:EdgeInsets.fromLTRB(10.0,16.0,10.0,16.0),
                       color: Colors.indigo[900],
                       child: Column(
                         children: [
                            SizedBox(height: 20.0),
                           Text('  ${weirange.text}  ',style:mycardwithcolor.copyWith(color:Colors.red)),
                           SizedBox(height: 40.0),
                           
              Row(
                children: [
               
                  Expanded(
                    flex:2,
                    // ignore: deprecated_member_use
                    child: RaisedButton
                    (textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(25.0),
                        child: const Text('Exercise',style:TextStyle(fontSize:20.0)),
                      ),
                        onPressed:() { print('iiiii');
                           Navigator.of(context).push(
                             MaterialPageRoute(
                               builder:(context)=>Disexcercise()
                             )
                           );
                         }, 
                                 ),
                  ),
                  Expanded(
                flex :1,
                child: SizedBox(width: 10.0,),
                               ),                
              Expanded(
                flex: 2,
                // ignore: deprecated_member_use
                child: FlatButton.icon(
                               icon: Icon(Icons.info,size:30),
                               
                               label: Text('info'),
                               onPressed:()//async
                               { //await _auth.signOut();
                                       print('iiiii');
                                       
                               Navigator.of(context).push(
                             MaterialPageRoute(
                               builder:(context)=>Discardinfo(weirange:weirange)
                             )
                           );
                               }, 
                               ),
              ),
                ],
              )
              ,
                         ],
                       )

                     )
                     ],
                   )
                 
                // child: Text('${user.uid}',maxLines: 3)
                   
                  // ignore: deprecated_member_use
                /*  child: FlatButton.icon(
                   icon: Icon(Icons.email),
                   label: Text('createchart'),
                   onPressed:()
                   { print('iiiii');
                     Navigator.of(context).push(
                       MaterialPageRoute(
                         builder:(context)=>CreateChart()
                       )
                     );
                   }, 
                   ),*/
                   
               ),
           ),
              // child: Brewlist()),
          //),
        );
        }
        else
        {return Scaffold(
             backgroundColor: Colors.green,
             appBar: AppBar(
               title: Text('problem arrive'),
               backgroundColor: Colors.amber,
               elevation : 0.0,
               actions:<Widget>[
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                 icon: Icon(Icons.person),
                 label: Text('Account'),
                 onPressed:()//async
                 { //await _auth.signOut();
                         print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>Account()
                     )
                   );
                 }, 
                 ),
                 // ignore: deprecated_member_use
                 
                 // ignore: deprecated_member_use
                 
                 
               ],
             ),
             body :Container(
               decoration: BoxDecoration(
                 
                 image: DecorationImage(
                   image: AssetImage('assets/FoodBack.png'),
                   fit: BoxFit.cover,
                  // matchTextDirection: 
                 ),
                 // ignore: deprecated_member_use
                //child :Text('Diet app'),
               ),
                 //   child: Container(child: Text('${user.uid}',maxLines: 3))
               
             child: Column(
               children: [
                 SizedBox(height: 20.0),
                 Text(' problem ..cheak it'),
                 Text('signin please...'),
                 Text('cheak your network connectivity'),
                 
               ],
             )
                 
                // ignore: deprecated_member_use
              /*  child: FlatButton.icon(
                 icon: Icon(Icons.email),
                 label: Text('createchart'),
                 onPressed:()
                 { print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>CreateChart()
                     )
                   );
                 }, 
                 ),*/
                 
             ),
              // child: Brewlist()),
          //),
        );
        }
      }
    );
  }
   }
 
 /*
class Home extends StatefulWidget {
   //final AuthService _auth= AuthService();
   //bool ontapval=false;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
  // final AuthService _auth= AuthService();
    return  StreamBuilder<Userdata>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData)
        { Userdata? userdataobj = snapshot.data;
           Weightobject weirange=findweightrange(userdataobj!.ob1.calBMI());
           bool ontapval=false;
          return Scaffold(
             backgroundColor: Colors.green,
             appBar: AppBar(
               title: Text('welcome to app'),
               backgroundColor: Colors.amber,
               elevation : 0.0,
               actions:<Widget>[
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                 icon: Icon(Icons.person),
                 label: Text('Account'),
                 onPressed:()//async
                 { //await _auth.signOut();
                         print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>Account(userDataobj:userdataobj)
                     )
                   );
                 }, 
                 ),
                 // ignore: deprecated_member_use
                /* FlatButton.icon(
                 icon: Icon(Icons.person),
                 label: Text('tem home'),
                 onPressed:()//async
                 { //await _auth.signOut();
                         print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>Homemy()
                     )
                   );
                 }, 
                 ),*/
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                 icon: Icon(Icons.file_present),
                 label: Text('Diet chart'),
                 onPressed:()
                 { print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>CreateChart(userDataobj:userdataobj )
                     )
                   );
                 }, 
                 ),
                 
               ],
             ),
           body :Container(
             decoration: BoxDecoration(
                   
                   image: DecorationImage(
                     image: AssetImage('assets/FoodBack.png'),
                     fit: BoxFit.cover,
                    // matchTextDirection: 
                   ),
                   
                  //child :Text('Diet app'),
                 ),
                     child: Container(
                          
                  child: Column(
                     
                    children: <Widget>[
                      Row(
                 children: [
                   Expanded(child: Text('')),
                 ],
               ),
                     SizedBox(height: 80.0),
                     Container(child: Text('${userdataobj.uid}',style:myerror1)),
                     Card( 
                       //margin:EdgeInsets.all(100.0),
                       margin:EdgeInsets.fromLTRB(10.0,16.0,10.0,16.0),
                       color: Colors.indigo[900],
                       child: Column(
                         children: [
                            SizedBox(height: 20.0),
                           Text('  ${weirange.text}  ',style:mycardwithcolor.copyWith(color:Colors.red)),
                           SizedBox(height: 40.0),
                           
              Row(
                children: [
               
                  Expanded(
                    flex:2,
                    // ignore: deprecated_member_use
                    child: RaisedButton
                    (textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(25.0),
                        child: const Text('Exercise',style:TextStyle(fontSize:20.0)),
                      ),
                        onPressed:() { print('iiiii');
                           Navigator.of(context).push(
                             MaterialPageRoute(
                               builder:(context)=>Disexcercise()
                             )
                           );
                         }, 
                                 ),
                  ),
                  Expanded(
                flex :1,
                child: SizedBox(width: 10.0,),
                               ),                
              Expanded(
                flex: 2,
                // ignore: deprecated_member_use
                child: FlatButton.icon(
                               icon: Icon(Icons.info,size:30),
                               
                               label: Text('info'),
                               onPressed:()//async
                               { //await _auth.signOut();
                                       print('iiiii');
                                       
                                setState(()=>ontapval=!ontapval);
                               }, 
                               ),
              ),
                ],
              )
                         ],
                       )

                     )
                     ],
                   )
                 
                // child: Text('${user.uid}',maxLines: 3)
                   
                  // ignore: deprecated_member_use
                /*  child: FlatButton.icon(
                   icon: Icon(Icons.email),
                   label: Text('createchart'),
                   onPressed:()
                   { print('iiiii');
                     Navigator.of(context).push(
                       MaterialPageRoute(
                         builder:(context)=>CreateChart()
                       )
                     );
                   }, 
                   ),*/
                   
               ),
           ),
              // child: Brewlist()),
          //),
        );
        }
        else
        {return Scaffold(
             backgroundColor: Colors.green,
             appBar: AppBar(
               title: Text('problem arrive'),
               backgroundColor: Colors.amber,
               elevation : 0.0,
               actions:<Widget>[
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                 icon: Icon(Icons.person),
                 label: Text('Account'),
                 onPressed:()//async
                 { //await _auth.signOut();
                         print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>Account()
                     )
                   );
                 }, 
                 ),
                 // ignore: deprecated_member_use
                 
                 // ignore: deprecated_member_use
                 
                 
               ],
             ),
             body :Container(
               decoration: BoxDecoration(
                 
                 image: DecorationImage(
                   image: AssetImage('assets/FoodBack.png'),
                   fit: BoxFit.cover,
                  // matchTextDirection: 
                 ),
                 // ignore: deprecated_member_use
                //child :Text('Diet app'),
               ),
                 //   child: Container(child: Text('${user.uid}',maxLines: 3))
               
             child: Column(
               children: [
                 SizedBox(height: 20.0),
                 Text(' problem ..cheak it'),
                 Text('signin please...'),
                 Text('cheak your network connectivity'),
                 
               ],
             )
                 
                // ignore: deprecated_member_use
              /*  child: FlatButton.icon(
                 icon: Icon(Icons.email),
                 label: Text('createchart'),
                 onPressed:()
                 { print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>CreateChart()
                     )
                   );
                 }, 
                 ),*/
                 
             ),
              // child: Brewlist()),
          //),
        );
        }
      }
    );
  }
}*/