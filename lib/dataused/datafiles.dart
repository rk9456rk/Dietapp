
import 'package:dietapp/objects/forhomescreen.dart';
import 'package:flutter/material.dart';

class Objectlist
{ double value;
  String text;
  Objectlist({required this.value,required this.text});
}

List<Objectlist>  funcObjectlist()
{ List<Objectlist> activityl=[];
  activityl.add(Objectlist(value:1.3,text:
  'Sedentary(little or no exercise, desk job)'));
  activityl.add(Objectlist(value:1.55,text:
'Lightly active(light exercise/sports 1-3 days/week)'));
    activityl.add(Objectlist(value:1.65,text: 'Moderately active(moderate exercise/sports 6-7 days)'));
    activityl.add(Objectlist(value:1.8,text:'Very active(hard exercise every day, or 2 xs/day)'));
  activityl.add(Objectlist(value:2.0,text:'Extra active(hard exercise 2 or more times per day)'));
 return activityl;
}
String s1= 'BMI of under 18.5 A BMI of under 18.5 indicates that a person has insufficient weight, so they may need to put on some weight. They should ask a doctor or dietitian for advice.';
String s2='BMI of 18.5–24.9  A BMI of 18.5–24.9 indicates that a person has a healthy weight for their height. By maintaining a healthy weight, they can lower their risk of developing serious health problems.';
String s3='BMI of 25–29.9  A BMI of 25–29.9 indicates that a person is slightly overweight. A doctor may advise them to lose some weight for health reasons. They should talk with a doctor or dietitian for advice.';
String s4='BMI of over 30  A BMI of over 30 indicates that a person has obesity. Their health may be at risk if they do not lose weight. They should talk with a doctor or dietitian for advice.';
String taktiosstr='take balance diet';
List<Weightobject>  funclistchart()
{ List<Weightobject> activityl=[];
  activityl.add(Weightobject(value:40,text:
  'obsese(Class 3)',description: s4,info:taktiosstr,c1:Colors.red));
  activityl.add(Weightobject(value:35,text:
'obsese(Class 2)',description: s4,info:taktiosstr,c1:Colors.deepOrange));
    activityl.add(Weightobject(value:30,text: 'obsese(Class 1)',description: s4,info:taktiosstr,c1:Colors.orange));
    activityl.add(Weightobject(value:25,text:'OverWeight',description: s3,info:taktiosstr,c1:Colors.amber));
  activityl.add(Weightobject(value:18.5,text:'Healthy',description: s2,info:taktiosstr,c1:Colors.green));
  activityl.add(Weightobject(value:0.0,text:'UnderWeight',description: s1,info:taktiosstr,c1:Colors.blue));
 return activityl;
}
List<Homeexercise> funclistexercise()
{ List<Homeexercise> exercisel=[];
  exercisel.add(Homeexercise(title:'Walking ',
  description:'Walk at a moderate pace (2.8 to 3.2 mph) on a level surface and you’ll rack up at least 3.5 METs. Pick up the pace to a brisk 3.5 mph, however, and you’ll nab 4.3 METs, which works out to 293 calories/hour.',
  calorieperhrs:293));
  exercisel.add(Homeexercise(title:'Jumping rope',
  description:'At 11.0 METs, jumping rope is comparable to running at a pace of 7 mph (that’s 8.5 minutes per mile). Plus, jumping movements have been shown to promote stronger bones.',
  calorieperhrs:295));
  exercisel.add(Homeexercise(title:'Walking (239 calories/hour)',
  description:'Walk at a moderate pace (2.8 to 3.2 mph) on a level surface and you’ll rack up at least 3.5 METs. Pick up the pace to a brisk 3.5 mph, however, and you’ll nab 4.3 METs, which works out to 293 calories/hour.',
  calorieperhrs:297));
  return exercisel;
}