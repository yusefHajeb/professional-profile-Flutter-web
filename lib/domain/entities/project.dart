class Project {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String? liveUrl;
  final String? repositoryUrl;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.liveUrl,
    this.repositoryUrl,
  });
}