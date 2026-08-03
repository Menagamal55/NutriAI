import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';


class PageIndicator extends StatelessWidget {

  final int currentIndex;


  const PageIndicator({
    super.key,
    required this.currentIndex,
  });



  @override
  Widget build(BuildContext context) {

    return Row(

      mainAxisAlignment:
      MainAxisAlignment.center,


      children: List.generate(
        3,

        (index) {


          return AnimatedContainer(

            duration:
            const Duration(milliseconds: 300),


            margin:
            const EdgeInsets.symmetric(
              horizontal: 4,
            ),


            width:
            currentIndex == index
                ? 28
                : 8,


            height:
            8,


            decoration:
            BoxDecoration(

              color:
              currentIndex == index
                  ? AppColors.primary
                  : AppColors.lightGreen,


              borderRadius:
              BorderRadius.circular(10),

            ),

          );


        },

      ),

    );

  }

}