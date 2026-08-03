import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/profile_data_model.dart';

class ProfileGoalsCard extends StatelessWidget {
  final List<UserGoalData> goals;
  final VoidCallback? onEditTap;

  const ProfileGoalsCard({
    super.key,
    this.goals = const [
      UserGoalData(
        title: "Calories",
        value: "2,000 kcal / day",
        icon: Icons.local_fire_department_outlined,
      ),
      UserGoalData(
        title: "Weight",
        value: "65 kg",
        icon: Icons.monitor_weight_outlined,
      ),
      UserGoalData(
        title: "Height",
        value: "165 cm",
        icon: Icons.height_rounded,
      ),
    ],
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      // Goals Section Header
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Goals",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        GestureDetector(
          onTap: onEditTap,
          child: const Text(
            "Edit",
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

    // Goals List Card
    Container(
    decoration: BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: AppColors.cardBorder, width: 1),
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.025),
    blurRadius: 14,
    offset: const Offset(0, 4),
    ),
    ],
    ),
    child: Column(
    children: List.generate(goals.length, (index) {
    final goal = goals[index];
    final isLast = index == goals.length - 1;

    return Column(
    children: [
    Padding(
    padding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 14,
    ),
    child: Row(
    children: [
    // Soft Green Icon Box
    Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
    color: AppColors.primarySoft,
    borderRadius: BorderRadius.circular(12),
    ),
    child: Icon(
    goal.icon,
    color: AppColors.primary,
    size: 20,
    ),
    ),
    const SizedBox(width: 14),// Title & Subtitle Column
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              goal.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              goal.value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),

      // Chevron Trailing Icon
      const Icon(
        Icons.chevron_right_rounded,
        color: AppColors.textMuted,
        size: 20,
      ),
    ],
    ),
    ),
      if (!isLast)
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            color: AppColors.divider,
            height: 1,
            thickness: 1,
          ),
        ),
    ],
    );
    }),
    ),
    ),
      ],
    );
  }
}