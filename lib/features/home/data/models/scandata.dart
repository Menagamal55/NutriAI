
import 'package:menna/features/home/data/models/smodel.dart';

import '../models/scan_model.dart';



class RecentScansData {


  static const List<ScanModel> scans = [


    ScanModel(

      foodName: "Grilled Chicken Salad",

      image: "assets/images/food1.png",

      calories: "420 kcal",

      date: "Today",

    ),



    ScanModel(

      foodName: "Healthy Breakfast",

      image: "assets/images/food2.png",

      calories: "350 kcal",

      date: "Yesterday",

    ),



    ScanModel(

      foodName: "Fruit Bowl",

      image: "assets/images/food3.png",

      calories: "220 kcal",

      date: "2 days ago",

    ),


  ];

}