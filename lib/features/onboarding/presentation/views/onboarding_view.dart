import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/app_onbording.dart';

import '../../../../core/routes/routes.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/onboarding_item.dart';
import '../widgets/page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: AppOnboarding.pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingItem(
                      model: AppOnboarding.pages[index],
                    );
                  },
                ),
              ),
              PageIndicator(
                currentIndex: currentIndex,
              ),
              const SizedBox(height: 35),
              OnboardingButton(
                text: currentIndex == 2 ? "Get Started" : "Next",
                onTap: () {
                  if (currentIndex < 2) {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    context.go(Routes.login);
                  }
                },
              ),
              const SizedBox(height: 20),
              if (currentIndex != 2)
                TextButton(
                  onPressed: () {
                    context.go(Routes.login);
                  },
                  child: const Text("Skip"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}