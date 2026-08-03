git remote add origin https://github.com/Menagamal55/NutriAI.git
git branch -M main
git push -u origin mainimport 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'features/auth/auth_cubit.dart';
import 'firebase_options.dart';


late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Camera
  cameras = await availableCameras();

  runApp(
    BlocProvider(
      create: (_) => AuthCubit(),
      child: const NutriMindApp(),
    ),
  );
}