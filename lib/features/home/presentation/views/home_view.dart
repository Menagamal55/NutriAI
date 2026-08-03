import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

import '../widgets/home_header.dart';
import '../widgets/health_score_card.dart';
import '../widgets/nutrition_summary_card.dart';
import '../widgets/quick_actions_section.dart';
import '../widgets/recommended_meals_section.dart';
import '../widgets/ai_suggestion_card.dart';
import '../widgets/recent_scans_section.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color.fromARGB(255, 228, 246, 228),

      body: SafeArea(

        child: SingleChildScrollView(

          physics: const BouncingScrollPhysics(),

          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const HomeHeader(),

              const SizedBox(height: 20),


              const HealthScoreCard(),

              const SizedBox(height: 16),


              const NutritionSummaryCard(),

              const SizedBox(height: 20),


              const QuickActionsSection(),

              const SizedBox(height: 24),


              //  Spoonacular Recommended Meals
              const RecommendedMealsSection(),

              const SizedBox(height: 24),


              const AiSuggestionCard(),

              const SizedBox(height: 24),


              //  const RecentScansSection(),

              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}