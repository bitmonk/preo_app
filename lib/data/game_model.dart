enum GameName {
  sinners,
  lineUp,
  memory,
}

enum GameType {
  group,
  solo,
}

class Game {
  final GameName name;
  final GameType type;
  final String status;

  Game({
    required this.name,
    required this.type,
    required this.status,
  });

  String get nameDisplay => name.toString().split('.').last.capitalizeFirst;
  String get typeDisplay => type.toString().split('.').last.capitalizeFirst;
}

extension StringCasingExtension on String {
  String get capitalizeFirst => '${this[0].toUpperCase()}${this.substring(1)}';
}
