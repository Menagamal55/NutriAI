import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:menna/features/home/presentation/widgets/recepie.dart';

import '../cubit/recepiecubit.dart';
import '../cubit/recepiestate.dart';



class RecommendedMealsSection extends StatelessWidget {


const RecommendedMealsSection({super.key});


@override
Widget build(BuildContext context){


return BlocBuilder<RecipeCubit,RecipeState>(

builder:(context,state){


if(state is RecipeLoading){

return const Center(
child:CircularProgressIndicator(),
);

}


if(state is RecipeSuccess){


return SizedBox(

height:250,

child:ListView.builder(

scrollDirection:Axis.horizontal,

itemCount:state.recipes.length,


itemBuilder:(context,index){


return RecipeCard(
recipe:state.recipes[index],
);


},

),

);

}


return const SizedBox();

},


);


}


}