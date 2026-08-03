import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/app_string.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_style.dart';
import '../widgets/splash_logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startSplashTimer();
  }

  void startSplashTimer() {
    timer = Timer(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;
        context.go(Routes.onboarding);
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              const SplashLogo()
                  .animate()
                  .fadeIn(duration: 5000.ms)
                  .scale(
                    begin: const Offset(0.7, 0.7),
                    duration: 900.ms,
                    curve: Curves.easeOutBack,
                  ),
              const SizedBox(height: 24),

              // Tagline
              Text(
                AppStrings.tagline,
                textAlign: TextAlign.center,
                style: AppTextStyles.body,
              )
                  .animate()
                  .fadeIn(delay: 400.ms, duration: 700.ms)
                  .slideY(begin: 0.3, duration: 700.ms),
              const SizedBox(height: 45),

              // Loading
              SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  backgroundColor: AppColors.lightGreen,
                  color: AppColors.darkGreen,
                ),
              ).animate().fadeIn(delay: 900.ms),
            ],
          ),
        ),
      ),
    );
  }
}