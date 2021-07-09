List<String> daylist=[
'Monday',
'Tuesday',
'Wednesday',
'Thursday',
'Friday',
'Saturday',
'Sunday' ];
Dayobject funcdaychart(bool isveg,String day)
{ return Dayobject(whichday: day,breakfast: 'bread ',lunch: 'rice',teatime: 'biscuit',dinner:'roti',calorie:2000,tip:'do exercise');

}

class Dayobject
{ late final String whichday;
  late final String breakfast;
  late final String lunch;
  late final String teatime;
  late final String dinner;
  late final String tip;
  late final double calorie;
  
  Dayobject({ required this.whichday, required this.breakfast,required this.lunch,required this.teatime,required this.dinner,required this.tip,required this.calorie});
 // Dayobject();
}

class DietChart
{ late final List<Dayobject> day=[]; 
  final bool foodtype;
  DietChart({required this.foodtype});
  void makechart()
  { // foodtype =isveg;
    daylist.forEach((element)
       {
              day.add(funcdaychart(foodtype,element));
       }
  );
    }
    void pushindaylistchart( String whichday,
 String breakfast,
   String lunch,
  String teatime,
  String dinner,
   String tip,
    double calorie)
    { day.add(Dayobject(whichday: whichday,breakfast: breakfast,lunch: lunch,teatime: teatime,dinner:dinner,calorie:calorie,tip:tip));
     
    }
  }
  DietChart getdaychart()
  { DietChart ob= DietChart(foodtype:false);
     
     ob.makechart();
     return ob;
  }
  
  

     
     
