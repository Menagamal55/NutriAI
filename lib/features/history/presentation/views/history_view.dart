import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/history_mock_data.dart';
import '../../data/models/history_item_model.dart';
import '../widgets/history_header.dart';
import '../widgets/history_filter_tabs.dart';
import '../widgets/history_item_tile.dart';
import '../widgets/view_more_button.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  HistoryCategoryFilter _selectedFilter = HistoryCategoryFilter.all;

  @override
  Widget build(BuildContext context) {
    final allGroups = HistoryMockData.getMockHistoryGroups();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const HistoryHeader(),
              const SizedBox(height: 16),

              // Filter Tabs (All, Meals, Scans)
              HistoryFilterTabs(
                selectedFilter: _selectedFilter,
                onFilterChanged: (filter) {
                  setState(() {
                    _selectedFilter = filter;
                  });
                },
              ),
              const SizedBox(height: 24),

              // Grouped History Sections
              ...allGroups.map((group) {
                final filteredItems = _selectedFilter == HistoryCategoryFilter.all
                    ? group.items
                    : group.items.where((i) => i.category == _selectedFilter).toList();

                if (filteredItems.isEmpty) return const SizedBox.shrink();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Date Header (e.g. Today / Yesterday)
                    Text(
                      group.groupTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Section Items
                    ...filteredItems.map((item) {
                      return HistoryItemTile(
                        item: item,
                        onTap: () {
                          // Handle item click
                        },
                      );
                    }),
                    const SizedBox(height: 16),
                  ],
                );
              }),

              const SizedBox(height: 8),

              // View More Action Button
              ViewMoreButton(
                onPressed: () {
                  // Handle view more action
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
