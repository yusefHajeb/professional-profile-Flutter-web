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
          Project(
            id: '1',
            title: 'E-Commerce Mobile App',
            description:
                'A full-featured e-commerce application built with Flutter and Firebase. Features include product catalog, shopping cart, user authentication, and payment integration.',
            imageUrl:
                'assets/images/profile2.jpg', // Using profile image as placeholder
            technologies: ['Flutter', 'Firebase', 'Stripe', 'GetX'],
            githubUrl: 'https://github.com/yourusername/ecommerce-app',
            liveUrl: 'https://ecommerce-app.com',
          ),
          Project(
            id: '2',
            title: 'Task Management System',
            description:
                'A collaborative task management platform with real-time updates. Includes features like task assignment, progress tracking, and team collaboration tools.',
            imageUrl:
                'assets/images/profile2.jpg', // Using profile image as placeholder
            technologies: ['React', 'Node.js', 'MongoDB', 'Socket.io'],
            githubUrl: 'https://github.com/yourusername/task-manager',
            liveUrl: 'https://task-manager-app.com',
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
          ),
        ];
        emit(ProjectsLoaded(projects));
      } catch (e) {
        emit(ProjectsError('Failed to load projects: $e'));
      }
    });
  }
}
