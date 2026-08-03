import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../../data/models/reciepemodel.dart';


class RecipeCard extends StatelessWidget {

  final RecipeModel recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });


  @override
  Widget build(BuildContext context) {

    return Container(

      width: 220,

      margin: const EdgeInsets.only(right: 16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [

          BoxShadow(

            color: Colors.black.withOpacity(0.08),

            blurRadius: 10,

            offset: const Offset(0, 4),

          ),

        ],

      ),


      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [


          ClipRRect(

            borderRadius: const BorderRadius.vertical(

              top: Radius.circular(20),

            ),


            child: CachedNetworkImage(

              imageUrl: recipe.image,

              height: 120,

              width: double.infinity,

              fit: BoxFit.cover,


              placeholder: (context, url) {

                return const SizedBox(

                  height: 120,

                  child: Center(

                    child: CircularProgressIndicator(),

                  ),

                );

              },


              errorWidget: (context, url, error) {

                return Container(

                  height: 120,

                  color: Colors.grey.shade200,

                  child: const Center(

                    child: Icon(

                      Icons.restaurant,

                      size: 40,

                    ),

                  ),

                );

              },

            ),

          ),



          Padding(

            padding: const EdgeInsets.all(12),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [


                Text(

                  recipe.title,

                  maxLines: 2,

                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(

                    fontSize: 15,

                    fontWeight: FontWeight.bold,

                  ),

                ),


                const SizedBox(height: 12),


                Row(

                  children: [


                    const Icon(

                      Icons.local_fire_department,

                      size: 16,

                    ),


                    const SizedBox(width: 4),


                    Text(

                      "${recipe.calories} kcal",

                      style: const TextStyle(

                        fontSize: 12,

                      ),

                    ),


                    const SizedBox(width: 12),


                    Text(

                      recipe.protein,

                      style: const TextStyle(

                        fontSize: 12,

                      ),

                    ),


                  ],

                ),

              ],

            ),

          ),


        ],

      ),

    );

  }

}