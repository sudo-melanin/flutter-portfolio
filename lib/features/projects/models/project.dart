class Project {
  const Project({
    required this.name,
    required this.description,
    required this.technologies,
    required this.features,
    this.status = 'Completed',
    this.githubUrl,
    this.apkUrl,
  });

  final String name;
  final String description;
  final List<String> technologies;
  final List<String> features;
  final String status;
  final String? githubUrl;
  final String? apkUrl;
}
