import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:menna/features/home/presentation/cubit/recepiestate.dart';

import '../../data/models/recepieservice.dart';



class RecipeCubit extends Cubit<RecipeState>{

final SpoonacularService service;


RecipeCubit(this.service)
    : super(RecipeInitial());


Future<void> fetchRecipes() async{


emit(RecipeLoading());


try{

final recipes =
await service.getRecipes();


emit(
RecipeSuccess(recipes),
);


}catch(e){

emit(
RecipeError(e.toString()),
);

}


}

}