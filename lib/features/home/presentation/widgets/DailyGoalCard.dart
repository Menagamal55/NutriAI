import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';



class DailyGoalCard extends StatelessWidget {

  const DailyGoalCard({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    const int consumedCalories = 1300;

    const int totalCalories = 2000;


    final double progress =
        consumedCalories / totalCalories;



    return Container(

      width:
      double.infinity,


      padding:
      const EdgeInsets.all(20),


      decoration:

      BoxDecoration(

        color:
        Colors.white,


        borderRadius:
        BorderRadius.circular(28),


        boxShadow: [

          BoxShadow(

            color:
            Colors.black.withOpacity(0.05),

            blurRadius:
            20,

            offset:
            const Offset(0, 8),

          ),

        ],

      ),



      child:

      Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,


        children: [


          Row(

            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,


            children: [


              const Text(

                "Daily Goal",

                style:

                TextStyle(

                  fontSize:
                  18,

                  fontWeight:
                  FontWeight.bold,

                ),

              ),



              Container(

                padding:

                const EdgeInsets.symmetric(

                  horizontal:
                  12,

                  vertical:
                  6,

                ),


                decoration:

                BoxDecoration(

                  color:
                  AppColors.lightGreen,


                  borderRadius:
                  BorderRadius.circular(20),

                ),



                child:

                const Text(

                  "Today",

                  style:

                  TextStyle(

                    color:
                    AppColors.darkGreen,

                    fontSize:
                    12,

                    fontWeight:
                    FontWeight.w600,

                  ),

                ),

              ),


            ],

          ),



          const SizedBox(
            height:20,
          ),




          Row(

            crossAxisAlignment:
            CrossAxisAlignment.end,


            children: [


              Text(

                "$consumedCalories",

                style:

                const TextStyle(

                  fontSize:
                  32,

                  fontWeight:
                  FontWeight.bold,

                ),

              ),



              const SizedBox(
                width:6,
              ),



              Text(

                "/ $totalCalories kcal",

                style:

                TextStyle(

                  color:
                  Colors.grey.shade600,

                  fontSize:
                  14,

                ),

              ),


            ],

          ),



          const SizedBox(
            height:16,
          ),




          ClipRRect(

            borderRadius:
            BorderRadius.circular(20),


            child:

            LinearProgressIndicator(

              value:
              progress,


              minHeight:
              12,


              backgroundColor:
              Colors.grey.shade200,


              color:
              AppColors.darkGreen,


            ),

          ),



          const SizedBox(
            height:12,
          ),




          Text(

            "${totalCalories - consumedCalories} kcal remaining",

            style:

            TextStyle(

              color:
              Colors.grey.shade600,

              fontSize:
              13,

            ),

          ),



        ],

      ),

    );


  }

}