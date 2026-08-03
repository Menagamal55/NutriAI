import 'models/history_item_model.dart';

class HistoryMockData {
  static List<HistoryGroupModel> getMockHistoryGroups() {
    return const [
      HistoryGroupModel(
        groupTitle: "Today",
        items: [
          HistoryItemModel(
            id: "1",
            title: "Chicken Avocado Bowl",
            calories: 540,
            timeString: "12:30 PM",
            imagePath: "assets/images/image.png",
            category: HistoryCategoryFilter.scans,
          ),
          HistoryItemModel(
            id: "2",
            title: "Greek Yogurt with Berries",
            calories: 280,
            timeString: "8:45 AM",
            imagePath: "assets/images/image.png",
            category: HistoryCategoryFilter.meals,
          ),
        ],
      ),
      HistoryGroupModel(
        groupTitle: "Yesterday",
        items: [
          HistoryItemModel(
            id: "3",
            title: "Grilled Salmon",
            calories: 620,
            timeString: "7:30 PM",
            imagePath: "assets/images/image.png",
            category: HistoryCategoryFilter.meals,
          ),
          HistoryItemModel(
            id: "4",
            title: "Avocado Toast",
            calories: 390,
            timeString: "1:15 PM",
            imagePath: "assets/images/image.png",
            category: HistoryCategoryFilter.scans,
          ),
        ],
      ),
    ];
  }
}
