import 'package:flutter/material.dart';


import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

import 'features/home/presentation/views/home_navbar.dart';


class NutriMindApp extends StatelessWidget {
  const NutriMindApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(

      debugShowCheckedModeBanner: false,

      title: "NutriMind AI",

      theme: AppTheme.light,

     routerConfig: AppRouter.router,

    );
  }
}