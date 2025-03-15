import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:professional_profile/domain/entities/project.dart';
import 'package:professional_profile/config/app_config.dart';
import 'package:professional_profile/domain/repositories/project_repository.dart';

// Events
abstract class ProjectsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProjects extends ProjectsEvent {}

// States
abstract class ProjectsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProjectsInitial extends ProjectsState {}

class ProjectsLoading extends ProjectsState {}

class ProjectsLoaded extends ProjectsState {
  final List<Project> projects;

  ProjectsLoaded(this.projects);

  @override
  List<Object> get props => [projects];
}

class ProjectsError extends ProjectsState {
  final String message;

  ProjectsError(this.message);

  @override
  List<Object> get props => [message];
}

// Bloc
class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final ProjectRepository _projectRepository = getIt<ProjectRepository>();

  ProjectsBloc() : super(ProjectsInitial()) {
    on<LoadProjects>((event, emit) async {
      emit(ProjectsLoading());
      try {
        final projects = await _projectRepository.getProjects();
        emit(ProjectsLoaded(projects));
      } catch (e) {
        emit(ProjectsError(e.toString()));
      }
    });
  }
}
