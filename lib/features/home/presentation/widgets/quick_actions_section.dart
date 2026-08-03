import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/theme/app_colors.dart';

class QuickActionItem {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const QuickActionItem({
    required this.label,
    required this.icon,
    required this.onTap,
  });
}

class QuickActionsSection extends StatelessWidget {
  final List<QuickActionItem>? actions;

  const QuickActionsSection({
    super.key,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final List<QuickActionItem> defaultActions = actions ?? [
      QuickActionItem(
        label: "Scan Food",
        icon: Icons.qr_code_scanner_rounded,
        onTap: () {
          context.push(Routes.scanner);
        },
      ),
      QuickActionItem(
        label: "AI Chat",
        icon: Icons.chat_bubble_outline_rounded,
        onTap: () {
          context.push(Routes.chat);
        },
      ),
      QuickActionItem(
        label: "History",
        icon: Icons.history_rounded,
        onTap: () {
          context.push(Routes.history);
        },
      ),
      QuickActionItem(
        label: "Meals",
        icon: Icons.restaurant_menu_rounded,
        onTap: () {},
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quick Actions",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: defaultActions.map((action) {
            return Expanded(
              child: GestureDetector(
                onTap: action.onTap,
                child: Column(
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        color: AppColors.primarySoft,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.12),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        action.icon,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      action.label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
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