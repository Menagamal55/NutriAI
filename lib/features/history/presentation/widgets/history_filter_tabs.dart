import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/history_item_model.dart';

class HistoryFilterTabs extends StatelessWidget {
  final HistoryCategoryFilter selectedFilter;
  final ValueChanged<HistoryCategoryFilter> onFilterChanged;

  const HistoryFilterTabs({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _TabItem(
          label: "All",
          isSelected: selectedFilter == HistoryCategoryFilter.all,
          onTap: () => onFilterChanged(HistoryCategoryFilter.all),
        ),
        _TabItem(
          label: "Meals",
          isSelected: selectedFilter == HistoryCategoryFilter.meals,
          onTap: () => onFilterChanged(HistoryCategoryFilter.meals),
        ),
        _TabItem(
          label: "Scans",
          isSelected: selectedFilter == HistoryCategoryFilter.scans,
          onTap: () => onFilterChanged(HistoryCategoryFilter.scans),
        ),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primarySoft : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? Border.all(color: AppColors.primary.withValues(alpha: 0.15), width: 1)
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
