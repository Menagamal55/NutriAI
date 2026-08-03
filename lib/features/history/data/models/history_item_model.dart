enum HistoryCategoryFilter { all, meals, scans }

class HistoryItemModel {
  final String id;
  final String title;
  final int calories;
  final String timeString;
  final String imagePath;
  final HistoryCategoryFilter category;

  const HistoryItemModel({
    required this.id,
    required this.title,
    required this.calories,
    required this.timeString,
    required this.imagePath,
    required this.category,
  });
}

class HistoryGroupModel {
  final String groupTitle;
  final List<HistoryItemModel> items;

  const HistoryGroupModel({
    required this.groupTitle,
    required this.items,
  });
}
