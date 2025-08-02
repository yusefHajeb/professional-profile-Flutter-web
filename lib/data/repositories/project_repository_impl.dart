import 'package:professional_profile/domain/entities/project.dart';
import 'package:professional_profile/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  @override
  Future<List<Project>> getProjects() async {
    // Simulating API call
    await Future.delayed(const Duration(seconds: 1));

    return [
      Project(
        id: '1',
        imageUrl:
            'https://flutter.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg',
        title: 'E-commerce Platform',
        description:
            'Electricity Info is a Flutter application designed to track and analyze electricity consumption from generators and solar systems. The app provides users with detailed reports, including consumption metrics, diesel usage, and the ability to export reports as PDF files.',
        technologies: ['Flutter', 'Firebase', 'Stripe'],
        images: [
          'https://example.com/ecommerce1.jpg',
          'https://example.com/ecommerce2.jpg',
          'https://example.com/ecommerce3.jpg',
        ],
        keyFeatures: [
          'User authentication and profile management',
          'Track electricity consumption from generators and solar systems.'
              'Generate detailed reports based on date ranges.'
              'Export reports to PDF format for easy sharing and printing.'
              'User-friendly interface with date selection and summary views.'
        ],
        challengesAndSolutions:
            'One of the main challenges was implementing real-time inventory updates. We solved this by using Firebase Realtime Database to ensure that product availability is always up-to-date across all users.',
        githubUrl: 'https://github.com/yourusername/ecommerce-platform',
        liveUrl: 'https://ecommerce-platform-demo.com',
      ),
      Project(
        id: '',
        imageUrl: 'a',
        title: 'Task Management App',
        description:
            'A collaborative task management application designed to improve team productivity and project organization.',
        technologies: ['Flutter', 'Node.js', 'MongoDB'],
        images: [
          'https://example.com/taskmanager1.jpg',
          'https://example.com/taskmanager2.jpg',
        ],
        keyFeatures: [
          'Task creation and assignment',
          'Project timelines and milestones',
          'Team collaboration tools',
          'Performance analytics',
          'Integration with popular productivity tools',
        ],
        challengesAndSolutions:
            'Ensuring seamless real-time updates across multiple devices was challenging. We implemented a WebSocket-based solution to push updates to all connected clients instantly.',
        githubUrl: 'https://github.com/yourusername/task-management-app',
        liveUrl: 'https://task-management-app-demo.com',
      ),
    ];
  }
}
