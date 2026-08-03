import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/scan/presentation/screens/scan_screen.dart';
import '../../features/chatbot/screens/chat_screen.dart';
import '../../features/history/presentation/views/history_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';

class MainLayoutView extends StatefulWidget {
  final int initialIndex;
  const MainLayoutView({super.key, this.initialIndex = 0});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  late int _currentIndex;

  final List<Widget> _screens = const [
    HomeView(),
    CameraScreen(),
    ChatScreen(),
    HistoryView(),
    ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_rounded, Icons.home_outlined, "Home"),
                _buildNavItem(1, Icons.qr_code_scanner_rounded, Icons.camera_alt_outlined, "Scan"),
                _buildNavItem(2, Icons.smart_toy_rounded, Icons.smart_toy_outlined, "AI Chat"),
                _buildNavItem(3, Icons.history_rounded, Icons.history_outlined, "History"),
                _buildNavItem(4, Icons.person_rounded, Icons.person_outline, "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData activeIcon, IconData inactiveIcon, String label) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primarySoft : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : inactiveIcon,
              color: isSelected ? AppColors.darkGreen : AppColors.grey,
              size: 24,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.darkGreen,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
