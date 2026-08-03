import 'package:flutter/material.dart';

class UserProfileData {
  final String name;
  final String email;
  final String levelTitle;
  final String avatarUrl;

  const UserProfileData({
    required this.name,
    required this.email,
    required this.levelTitle,
    required this.avatarUrl,
  });
}

class UserGoalData {
  final String title;
  final String value;
  final IconData icon;

  const UserGoalData({
    required this.title,
    required this.value,
    required this.icon,
  });
}

class AchievementData {
  final String count;
  final String label;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  const AchievementData({
    required this.count,
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  });
}
