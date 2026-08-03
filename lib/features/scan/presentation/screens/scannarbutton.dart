// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:itigradutionproject/features/scan/presentation/cubit/scsncubit.dart';

// final picker = ImagePicker();


// Future scanFood(BuildContext context) async {


// final image =
// await picker.pickImage(
// source: ImageSource.gallery
// );


// if(image!=null){

// context
// .read<ScannerCubit>()
// .scanFood(
// File(image.path)
// );

// }


// }