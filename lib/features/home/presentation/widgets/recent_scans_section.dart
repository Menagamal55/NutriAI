import 'package:flutter/material.dart';


import '../../../../core/theme/app_colors.dart';
import '../../data/models/scan_model.dart';
import '../../data/models/scandata.dart';
import '../../data/models/smodel.dart';



class RecentScansSection extends StatelessWidget {


  const RecentScansSection({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    return Column(

      crossAxisAlignment:
      CrossAxisAlignment.start,


      children: [


        Row(

          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,


          children: [


            const Text(

              "Recent Scans",

              style:

              TextStyle(

                fontSize:18,

                fontWeight:
                FontWeight.bold,

              ),

            ),



            TextButton(

              onPressed: (){


                // TODO:
                // Navigate History


              },

              child:

              const Text(

                "See All",

              ),

            ),


          ],

        ),



        const SizedBox(
          height:12,
        ),



        SizedBox(

          height:150,


          child:

          ListView.builder(

            scrollDirection:
            Axis.horizontal,


            itemCount:
            RecentScansData.scans.length,


            itemBuilder:
            (context,index){


              return _RecentScanCard(

                scan:
                RecentScansData.scans[index],

              );


            },

          ),

        ),


      ],

    );


  }


}






class _RecentScanCard extends StatelessWidget {


  final ScanModel scan;



  const _RecentScanCard({

    required this.scan,

  });



  @override
  Widget build(BuildContext context) {


    return Container(

      width:
      180,


      margin:

      const EdgeInsets.only(
        right:12,
      ),


      padding:
      const EdgeInsets.all(12),



      decoration:

      BoxDecoration(

        color:
        Colors.white,


        borderRadius:
        BorderRadius.circular(22),


        boxShadow:[

          BoxShadow(

            color:
            Colors.black.withOpacity(.05),

            blurRadius:
            15,

          ),

        ],

      ),



      child:

      Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,


        children:[



          ClipRRect(

            borderRadius:
            BorderRadius.circular(16),


            child:

            Image.asset(

              scan.image,

              height:
              65,

              width:
              double.infinity,


              fit:
              BoxFit.cover,

            ),

          ),



          const SizedBox(
            height:8,
          ),



          Text(

            scan.foodName,

            maxLines:
            1,


            overflow:
            TextOverflow.ellipsis,


            style:

            const TextStyle(

              fontWeight:
              FontWeight.w600,

            ),

          ),



          const SizedBox(
            height:4,
          ),



          Text(

            scan.calories,

            style:

            TextStyle(

              color:
              AppColors.darkGreen,

              fontSize:
              13,

            ),

          ),



        ],

      ),

    );

  }

}