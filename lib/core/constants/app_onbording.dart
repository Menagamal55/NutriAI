import '../../features/onboarding/data/onboarding_model.dart';
import 'app_images.dart';

class AppOnboarding {
  static const List<OnboardingModel> pages = [
    OnboardingModel(
      image: AppAssets.onboarding1,
      title: "Track Your Nutrition Effortlessly",
      description: "Snap a photo of your meal and let AI break down calories, protein, carbs, and fats instantly.",
    ),
    OnboardingModel(
      image: AppAssets.onboarding2,
      title: "Personalized AI Nutrition Assistant",
      description: "Chat with NutriMind AI to get real-time diet tips, recipe advice, and healthy meal options.",
    ),
    OnboardingModel(
      image: AppAssets.onboarding3,
      title: "Achieve Your Health Goals",
      description: "Monitor your daily intake and progress with interactive charts and intelligent recommendations.",
    ),
  ];
}
