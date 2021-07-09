import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/objects/dietchart.dart';
import 'package:dietapp/services/ser_object.dart';


Map<String,dynamic>  functomapdoc( Userdata newobj11)
{   Map<String,dynamic> mp1={};
  
 
  mp1['name'] =newobj11.ob1.name;
  
  mp1['gender'] =newobj11.ob1.gender;//late String gender;
  mp1['foodtype'] =newobj11.ob1.foodtype;//late bool foodtype; // isveg true or nonveg false
  mp1['height'] =newobj11.ob1.height;//late double height;
  mp1['weight'] =newobj11.ob1.weight;//late double weight;
  mp1['age'] =newobj11.ob1.age;//late int age;
  mp1['bodyfatper'] =newobj11.ob1.bodyfatper;//late double bodyfatper; //body fat percentage
  mp1['leanfactor'] =newobj11.ob1.leanfactor;//late double leanfactor;
  mp1['activity'] =newobj11.ob1.activity;//late double activity;
  mp1['calorie'] =newobj11.ob1.calorie;//late int calorie;
  
  for(int i=0;i<7;i++)
  {
       mp1['whichday$i'] = newobj11.userdiet.day[i].whichday;                       //final String whichday;
       mp1['breakfast$i'] = newobj11.userdiet.day[i].breakfast;                 
        // final String breakfast;
       mp1['lunch$i'] = newobj11.userdiet.day[i].lunch;                   // final String lunch;
       mp1['teatime$i'] = newobj11.userdiet.day[i].teatime;                   //final String teatime;
       mp1['dinner$i'] = newobj11.userdiet.day[i].dinner;                   // final String dinner;
       mp1['tip$i'] = newobj11.userdiet.day[i].tip;                  //final String tip;
        mp1['calorie$i'] = newobj11.userdiet.day[i].calorie;               //final double calorie;
  }
 
 return mp1;
}


class DatabaseService
{ final String uid;
DatabaseService({required this.uid});
  final CollectionReference brewCollection=Firestore.
  instance.collection('Diet');

// for  updata
Future updateUserData( Userdata ob2) async{
  Map<String ,dynamic> st=functomapdoc(ob2);
  return await brewCollection.document(uid).setData(st);

                            
}
// brew list
/*List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot)
{
  return snapshot.documents.map((doc)
  {return Brew( //uid: doc['uid'],
  name: doc.data['name']??'',
  strength:doc.data['strength']??0,sugar: doc.data['sugar']??'0');
  }).toList();
}*/
Userdata _userDataFromsnapshot(DocumentSnapshot snapshot)
{
UserInformation userinfo=UserInformation();

userinfo.updateuserinformation(snapshot.data['name'],snapshot.data['gender'],snapshot.data['foodtype'],
 snapshot.data['height'], snapshot.data['weight'], snapshot.data['age'], snapshot.data['activity']);
DietChart userdiet=DietChart(foodtype:snapshot.data['foodtype']);

for(int i=0;i<7;i++)
  { userdiet.pushindaylistchart(snapshot.data['whichday$i'], 
  snapshot.data['breakfast$i'], snapshot.data['lunch$i'] ,
  snapshot.data['teatime$i'], snapshot.data['dinner$i'], snapshot.data['tip$i'] ,
  snapshot.data['calorie$i']);
    /* mp1['whichday$i'] = newobj11.userdiet.day[i].whichday;                       //final String whichday;
      mp1['breakfast$i'] = newobj11.userdiet.day[i].breakfast;                 
        // final String breakfast;
      mp1['lunch$i'] = newobj11.userdiet.day[i].lunch;                   // final String lunch;
       mp1['teatime$i'] = newobj11.userdiet.day[i].teatime;                   //final String teatime;
       mp1['dinner$i'] = newobj11.userdiet.day[i].dinner;                   // final String dinner;
       mp1['tip$i'] = newobj11.userdiet.day[i].tip;                  //final String tip;
        mp1['calorie$i'] = newobj11.userdiet.day[i].calorie;   
        */            //final double calorie;
  }

Userdata userret=Userdata(uid: uid);

userret.makeUserdata(userinfo, userdiet);
return userret;
}
// get user document
Stream<Userdata> get userData{
  return brewCollection.document(uid).snapshots().map(
    _userDataFromsnapshot
  );
}
}