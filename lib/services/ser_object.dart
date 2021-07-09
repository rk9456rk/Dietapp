import 'package:dietapp/dataused/datafiles.dart';
import 'package:dietapp/objects/dietchart.dart';
import 'package:dietapp/objects/forhomescreen.dart';


Weightobject findweightrange(double bmi)
{  List<Weightobject > l1= funclistchart();
  int ans=l1.length-1;
   for(int i=0;i<l1.length-1;i++)
   if(l1[i].value<bmi)
   return l1[i];

   return l1[ans];

}



class User{
  final String uid;
  User({required this.uid});
}
Map<int ,double> malelean={28:8.5,21:9.5,15:9.5,10:1.0};
Map<int ,double> femalelean={38:8.5,29:9.5,19:9.5,14:1.0}; 
List<double> leanlist=[8.5,9.0,9.5,1.0];

double findleanfactor(String gender1,double bfr )
{ double ans=2.0;
  if(gender1=='female')
   { 
     femalelean.forEach((k,v)
     { if(k<=bfr)
         if(ans==2.0){ans=v; }
     });
    if(ans==2.0) ans=1.0;
    return ans;
   }
   else
   { 
     malelean.forEach((k,v)
     { if(k<=bfr)
         {ans=v; }
     });
     if(ans==2.0) ans=1.0;
    return ans;
   }


 
}
class UserInformation
{ late String name;
  late String gender;
  late bool foodtype; // isveg true or nonveg false
  late double height;
  late double weight;
  late int age;
  late double bodyfatper; //body fat percentage
  late double leanfactor;
  late double activity;
  late int calorie;
  void updateuserinformation(String name1,String gender1,bool foodtype1, // isveg true or nonveg false
   double height1,double weight1,int age1,double activity1)
  {  name= name1;
     gender= gender1;
      foodtype=foodtype1;
       // isveg true or nonveg false
    height=height1;
    weight= weight1;
    age= age1;
     activity=activity1;
     bodyfatper=findBFP();
     leanfactor=findleanfactor(gender,bodyfatper);
     calorie=findcalorie();
  }
  double calBMI()
  {
    return ((weight*10000)/(height*height));

  }
  double findBFP() //body fat percentage
  { 
    double bmi=calBMI();
     
    double fac =(1.20*bmi)/(0.23*age);
    if(gender=='female')
    return fac-5.4;

    return fac-16.2;
  }
  int findcalorie()
  { 
    double x= 24*weight*leanfactor*activity;
    if(gender=='female')
    x= x*0.9;
     
     return x.toInt();

  }
  

}

class Userdata
{ final  String uid;
  DietChart userdiet=DietChart(foodtype:false);
  UserInformation ob1=UserInformation();
   Userdata({required this.uid});

   void makeUserdata(UserInformation userobject1,DietChart userdiet1)
   { ob1= userobject1 ;
     userdiet= userdiet1;  
     print('consdata');
   }
}