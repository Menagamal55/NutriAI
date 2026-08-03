import 'package:flutter/material.dart';
import '../../../../core/routes/routes.dart';

class QuickActionModel {
  final String title;
  final IconData icon;
  final String route;

  const QuickActionModel({
    required this.title,
    required this.icon,
    required this.route,
  });
}

class QuickActionsData {
  static const List<QuickActionModel> actions = [
    QuickActionModel(
      title: "Scan Food",
      icon: Icons.camera_alt_outlined,
      route: Routes.scanner,
    ),
    QuickActionModel(
      title: "AI Chat",
      icon: Icons.smart_toy_outlined,
      route: Routes.chat,
    ),
    QuickActionModel(
      title: "History",
      icon: Icons.history_rounded,
      route: Routes.history,
    ),
    QuickActionModel(
      title: "Meal Planner",
      icon: Icons.restaurant_menu_rounded,
      route: Routes.history,
    ),
  ];
}