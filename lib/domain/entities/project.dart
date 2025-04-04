class Project {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final List<String> technologies;
  final List<String> images;
  final List<String> keyFeatures;
  final String challengesAndSolutions;
  final String? githubUrl;
  final String? liveUrl;
  final List<String>? features;

  Project({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.technologies,
    required this.images,
    required this.keyFeatures,
    required this.challengesAndSolutions,
    this.githubUrl,
    this.liveUrl,
    this.features,
  });
}
