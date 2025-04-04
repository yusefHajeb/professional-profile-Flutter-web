import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:professional_profile/domain/entities/project.dart';

// Events
abstract class ProjectsEvent {}

class LoadProjects extends ProjectsEvent {}

// States
abstract class ProjectsState {}

class ProjectsInitial extends ProjectsState {}

class ProjectsLoading extends ProjectsState {}

class ProjectsLoaded extends ProjectsState {
  final List<Project> projects;

  ProjectsLoaded(this.projects);
}

class ProjectsError extends ProjectsState {
  final String message;

  ProjectsError(this.message);
}

// Bloc
class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc() : super(ProjectsInitial()) {
    on<LoadProjects>((event, emit) async {
      emit(ProjectsLoading());
      try {
        final projects = [
          // const Project(
          //   id: '1',
          //   title: 'E-Commerce Mobile App',
          //   description:
          //       'A full-featured e-commerce application built with Flutter and Laravel. Features include product catalog, shopping cart, user authentication, and payment integration.',
          //   imageUrl:
          //       'assets/images/profile2.jpg', // Using profile image as placeholder
          //   technologies: ['Flutter', 'Firebase', 'Stripe', 'GetX'],
          //   githubUrl: 'https://github.com/yourusername/ecommerce-app',
          //   liveUrl: 'https://ecommerce-app.com',
          // ),
          Project(
            id: '2',
            title: 'Task Management System',
            description:
                'A Smart task management app . Includes features like task assignment, progress tracking, and Notifications daily',
            imageUrl:
                'assets/images/profile2.jpg', // Using profile image as placeholder
            technologies: ['React', 'Node.js', 'MongoDB', 'Socket.io'],
            githubUrl: 'https://github.com/yourusername/task-manager',
            liveUrl: 'https://task-manager-app.com',
            images: [
              'https://example.com/ecommerce1.jpg',
              'https://example.com/ecommerce2.jpg',
              'https://example.com/ecommerce3.jpg',
            ],
            keyFeatures: [
              'User authentication and profile management',
              'Product search and filtering',
              'Shopping cart and wishlist',
              'Secure payment processing',
              'Order tracking and history',
            ],
            challengesAndSolutions:
                'One of the main challenges was implementing real-time inventory updates. We solved this by using Firebase Realtime Database to ensure that product availability is always up-to-date across all users.',
          ),
          Project(
            id: '3',
            title: 'Social Media Dashboard',
            description:
                'Analytics dashboard for social media metrics and engagement tracking. Real-time data visualization and reporting tools.',
            imageUrl:
                'assets/images/profile2.jpg', // Using profile image as placeholder
            technologies: ['Flutter', 'GraphQL', 'AWS', 'D3.js'],
            githubUrl: 'https://github.com/yourusername/social-dashboard',
            liveUrl: 'https://social-dashboard.com',
            images: [
              'https://example.com/ecommerce1.jpg',
              'https://example.com/ecommerce2.jpg',
              'https://example.com/ecommerce3.jpg',
            ],
            keyFeatures: [
              'User authentication and profile management',
              'Product search and filtering',
              'Shopping cart and wishlist',
              'Secure payment processing',
              'Order tracking and history',
            ],
            challengesAndSolutions:
                'One of the main challenges was implementing real-time inventory updates. We solved this by using Firebase Realtime Database to ensure that product availability is always up-to-date across all users.',
          ),
          Project(
            id: '4',
            title: 'Electricity Info',
            description:
                'Electricity Info is a Flutter application designed to track and analyze electricity consumption from generators and solar systems.',
            imageUrl:
                'assets/images/profile2.jpg', // Using profile image as placeholder
            technologies: ['Flutter', 'Sqflite', 'pdf', 'Provider'],
            githubUrl: 'https://github.com/yusefHajeb/ecommerce-app',
            liveUrl: 'https://ecommerce-app.com',
            features: [
              'Track electricity consumption from generators and solar systems',
              'Generate detailed reports based on date ranges',
              'Export reports to PDF format for easy sharing and printing',
              'User-friendly interface with date selection and summary views.'
            ],
            images: [
              'https://example.com/ecommerce1.jpg',
              'https://example.com/ecommerce2.jpg',
              'https://example.com/ecommerce3.jpg',
            ],
            keyFeatures: [
              'User authentication and profile management',
              'Product search and filtering',
              'Shopping cart and wishlist',
              'Secure payment processing',
              'Order tracking and history',
            ],
            challengesAndSolutions:
                'One of the main challenges was implementing real-time inventory updates. We solved this by using Firebase Realtime Database to ensure that product availability is always up-to-date across all users.',
          ),
        ];
        emit(ProjectsLoaded(projects));
      } catch (e) {
        emit(ProjectsError('Failed to load projects: $e'));
      }
    });
  }
}
