import 'package:professional_profile/domain/entities/project.dart';
import 'package:professional_profile/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  @override
  Future<List<Project>> getProjects() async {
    // Simulated data - replace with actual database calls
    return [
      const Project(
        id: '1',
        title: 'E-Commerce Platform',
        description:
            'A full-featured e-commerce platform built with Flutter and Firebase',
        imageUrl:
            'https://flutter.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg',
        technologies: ['Flutter', 'Firebase', 'Stripe'],
      ),
      const Project(
        id: '2',
        title: 'Task Management App',
        description: 'A collaborative task management application',
        imageUrl:
            'https://flutter.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
        technologies: ['React', 'Node.js', 'MongoDB'],
      ),
      const Project(
        id: '2',
        title: 'Task Management App',
        description: 'A collaborative task management application',
        imageUrl:
            'https://flutter.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
        technologies: ['React', 'Node.js', 'MongoDB'],
      ),
      const Project(
        id: '2',
        title: 'Task Management App',
        description: 'A collaborative task management application',
        imageUrl:
            'https://flutter.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
        technologies: ['React', 'Node.js', 'MongoDB'],
      ),
      const Project(
        id: '2',
        title: 'Task Management App',
        description: 'A collaborative task management application',
        imageUrl:
            'https://flutter.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
        technologies: ['React', 'Node.js', 'MongoDB'],
      ),
    ];
  }
}
