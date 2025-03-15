import 'package:professional_profile/domain/entities/project.dart';

abstract class ProjectRepository {
  Future<List<Project>> getProjects();
}
