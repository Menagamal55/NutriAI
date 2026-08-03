import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/profile_data_model.dart';

class ProfileAchievementsSection extends StatelessWidget {
  final List<AchievementData> achievements;
  final VoidCallback? onViewAllTap;

  const ProfileAchievementsSection({
    super.key,
    this.achievements = const [
      AchievementData(
        count: "7",
        label: "Day Streak",
        icon: Icons.local_fire_department_rounded,
        iconColor: Color(0xFFFF6D00),
        bgColor: Color(0xFFFFF3E0),
      ),
      AchievementData(
        count: "20",
        label: "Meals Scanned",
        icon: Icons.eco_rounded,
        iconColor: AppColors.primary,
        bgColor: AppColors.primaryLight,
      ),
      AchievementData(
        count: "85+",
        label: "Health Score",
        icon: Icons.emoji_events_rounded,
        iconColor: AppColors.gold,
        bgColor: AppColors.goldLight,
      ),
    ],
    this.onViewAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      // Achievements Header Row
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Achievements",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        GestureDetector(
          onTap: onViewAllTap,
          child: const Text(
            "View All",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    ),
    const SizedBox(height: 12),

    // Achievements Cards Row
    Row(
    children: achievements.map((item) {
    return Expanded(
    child: Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    padding: const EdgeInsets.symmetric(
    vertical: 16,
    horizontal: 8,
    ),
    decoration: BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: AppColors.cardBorder, width: 1),
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.025),
    blurRadius: 12,
    offset: const Offset(0, 4),
    ),
    ],
    ),
    child: Column(
    children: [
    // Shield Badge Container
    Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
    color: item.bgColor,
    shape: BoxShape.circle,
    ),
    child: Icon(
    item.icon,
    color: item.iconColor,
    size: 24,
    ),
    ),
    const SizedBox(height: 10),
    // Count / Value
    Text(
    item.count,
    style: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    ),
    ),
    const SizedBox(height: 2),
    // Label
    Text(
    item.label,
    textAlign: TextAlign.center,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),
    ),
    ],
    ),
    ),
    );
    }).toList(),
    ),
      ],
    );
  }
}