import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/profile_data_model.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfileData user;
  final VoidCallback? onSettingsTap;

  const ProfileHeader({
    super.key,
    this.user = const UserProfileData(
      name: "Menna Gamal",
      email: "menna.gamal@gmail.com",
      levelTitle: "Gold Level",
      avatarUrl: "",
    ),
    this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      // Top Bar: Profile Title & Settings Icon
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        IconButton(
          onPressed: onSettingsTap,
          icon: const Icon(
            Icons.settings_outlined,
            color: AppColors.textPrimary,
            size: 22,
          ),
          splashRadius: 24,
        ),
      ],
    ),
    const SizedBox(height: 12),

    // User Avatar with Verified Badge
    Stack(
    alignment: Alignment.bottomRight,
    children: [
    Container(
    width: 90,
    height: 90,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: AppColors.primaryLight,
    border: Border.all(
    color: Colors.white,
    width: 3,
    ),
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 12,
    offset: const Offset(0, 4),
    ),
    ],
    ),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(45),
    child: user.avatarUrl.isNotEmpty
    ? Image.network(
    user.avatarUrl,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) =>
    const Icon(
    Icons.person_rounded,
    size: 50,
    color: AppColors.primary,
    ),
    )
        : const Icon(
    Icons.person_rounded,
    size: 50,
    color: AppColors.primary,
    ),
    ),
    ),
    Positioned(
    right: 2,
    bottom: 2,
    child: Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
    color: AppColors.primary,
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white, width: 2),
    ),
    child: const Icon(
    Icons.check_rounded,
    color: Colors.white,
    size: 12,
    ),
    ),
    ),
    ],
    ),
    const SizedBox(height: 12),

    // Name
    Text(
    user.name,
    style: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    ),
    ),
    const SizedBox(height: 4),

    // Email
    Text(
    user.email,
    style: const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    ),
    ),
    const SizedBox(height: 12),// Level Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.goldLight,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.gold.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.emoji_events_rounded,
                color: AppColors.gold,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                user.levelTitle,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}