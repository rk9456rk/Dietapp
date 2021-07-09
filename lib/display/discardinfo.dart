import 'package:dietapp/objects/forhomescreen.dart';
import 'package:flutter/material.dart';

class Discardinfo extends StatelessWidget {
  
  Weightobject weirange;
  Discardinfo({required this.weirange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
               title: Text('  INFO  '),
               backgroundColor: Colors.amber,
               elevation : 0.0,
               
             ),
      body: Container(
        color: weirange.c1,
        child: Column(
              children: [
                Center(child:Text(weirange.text,style:TextStyle(fontSize:40.0,fontWeight: FontWeight.bold))),
                Text(weirange.description,maxLines: 10,style:TextStyle(fontSize:20.0,fontWeight: FontWeight.bold)),
                SizedBox(height:20.0),
                Text('${weirange.info}',style:TextStyle(fontSize:20.0,fontWeight: FontWeight.bold)) ,
              ],
                 // ignore: deprecated_member_use
                 
            ),
        
      ),
    );
  }
}
