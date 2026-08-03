import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/routes.dart';

import '../../../../core/theme/app_colors.dart';



class WelcomeCard extends StatelessWidget {

  const WelcomeCard({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    return Container(

      width:
      double.infinity,


      padding:
      const EdgeInsets.all(22),


      decoration:

      BoxDecoration(

        gradient:

        const LinearGradient(

          colors: [

            Color(0xff1D4A1E),

            Color(0xff4CAF50),

          ],


          begin:
          Alignment.topLeft,


          end:
          Alignment.bottomRight,

        ),



        borderRadius:
        BorderRadius.circular(30),


      ),



      child:

      Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,


        children: [



          Row(

            children: [


              Container(

                height:
                50,

                width:
                50,


                decoration:

                BoxDecoration(

                  color:
                  Colors.white.withOpacity(.2),

                  shape:
                  BoxShape.circle,

                ),


                child:

                const Icon(

                  Icons.smart_toy_outlined,

                  color:
                  Colors.white,

                  size:
                  28,

                ),

              ),


              const SizedBox(
                width:14,
              ),



              const Expanded(

                child:

                Text(

                  "NutriMind AI",

                  style:

                  TextStyle(

                    color:
                    Colors.white,

                    fontSize:
                    20,

                    fontWeight:
                    FontWeight.bold,

                  ),

                ),

              ),


            ],

          ),



          const SizedBox(
            height:18,
          ),



          const Text(

            "Analyze your meals and build "
            "healthier habits with AI.",


            style:

            TextStyle(

              color:
              Colors.white,

              fontSize:
              14,

              height:
              1.5,

            ),

          ),



          const SizedBox(
            height:22,
          ),




          SizedBox(

            width:
            double.infinity,


            height:
            48,


            child:

            ElevatedButton.icon(


              onPressed: (){


                context.push(
                  Routes.scanner,
                );


              },


              icon:

              const Icon(

                Icons.camera_alt_outlined,

              ),



              label:

              const Text(

                "Scan Food",

                style:

                TextStyle(

                  fontWeight:
                  FontWeight.w600,

                ),

              ),



              style:

              ElevatedButton.styleFrom(


                backgroundColor:
                Colors.white,


                foregroundColor:
                AppColors.darkGreen,


                elevation:
                0,


                shape:

                RoundedRectangleBorder(

                  borderRadius:
                  BorderRadius.circular(18),

                ),

              ),

            ),

          ),


        ],

      ),


    );

  }

}