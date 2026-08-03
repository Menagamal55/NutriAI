/// Immutable model for a single profile goal row (Calories, Weight, Height).
class ProfileGoal {
  final String label;
  final String value;
  final String iconKey; // resolved to an IconData in the widget layer

  const ProfileGoal({
    required this.label,
    required this.value,
    required this.iconKey,
  });
}

/// Immutable model for a single achievement badge.
class ProfileAchievement {
  final String label;
  final String iconKey;
  final String colorKey; // e.g. 'orange', 'green', 'gold'

  const ProfileAchievement({
    required this.label,
    required this.iconKey,
    required this.colorKey,
  });
}

/// Aggregates everything the Profile screen needs to render.
class ProfileSummary {
  final String fullName;
  final String email;
  final String? avatarUrl;
  final String membershipLevel; // e.g. "Gold Level"
  final List<ProfileGoal> goals;
  final List<ProfileAchievement> achievements;

  const ProfileSummary(String s, {
    required this.fullName,
    required this.email,
    this.avatarUrl,
    required this.membershipLevel,
    required this.goals,
    required this.achievements,
  });
}
