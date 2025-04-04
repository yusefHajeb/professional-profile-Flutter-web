class Experience {
  final String companyName;
  final String companyLogo;
  final List<Position> positions;

  Experience({
    required this.companyName,
    required this.companyLogo,
    required this.positions,
  });
}

class Position {
  final String title;
  final String duration;
  final List<String> responsibilities;

  Position({
    required this.title,
    required this.duration,
    required this.responsibilities,
  });
}
