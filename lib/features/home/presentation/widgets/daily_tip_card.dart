import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';



class DailyTipCard extends StatelessWidget {

  const DailyTipCard({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    return Container(

      width:
      double.infinity,


      padding:
      const EdgeInsets.all(20),


      decoration:

      BoxDecoration(

        color:
        const Color(0xffF1F8E9),


        borderRadius:
        BorderRadius.circular(28),


      ),



      child:

      Row(

        crossAxisAlignment:
        CrossAxisAlignment.start,


        children: [



          Container(

            height:
            48,


            width:
            48,


            decoration:

            const BoxDecoration(

              color:
              AppColors.darkGreen,

              shape:
              BoxShape.circle,

            ),



            child:

            const Icon(

              Icons.lightbulb_outline_rounded,

              color:
              Colors.white,

            ),

          ),



          const SizedBox(
            width:16,
          ),




          const Expanded(

            child:

            Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,


              children: [



                Text(

                  "Daily Tip",

                  style:

                  TextStyle(

                    fontSize:
                    17,

                    fontWeight:
                    FontWeight.bold,

                  ),

                ),



                SizedBox(
                  height:8,
                ),



                Text(

                  "Drink enough water and add more "
                  "vegetables to your meals for a healthier day.",


                  style:

                  TextStyle(

                    fontSize:
                    13,

                    height:
                    1.5,

                    color:
                    Colors.black54,

                  ),

                ),


              ],

            ),

          ),


        ],

      ),

    );


  }

}