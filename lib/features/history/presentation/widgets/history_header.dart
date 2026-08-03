import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class HistoryHeader extends StatelessWidget {
  final VoidCallback? onCalendarTap;

  const HistoryHeader({
    super.key,
    this.onCalendarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "History",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        IconButton(
          onPressed: onCalendarTap,
          icon: const Icon(
            Icons.calendar_today_rounded,
            color: AppColors.primary,
            size: 20,
          ),
          splashRadius: 24,
        ),
      ],
    );
  }
}
