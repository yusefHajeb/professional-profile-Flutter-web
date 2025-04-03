import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:professional_profile/data/repositories/experience_repository_impl.dart';
import 'package:professional_profile/domain/entities/experience.dart';

// Events
abstract class ExperienceEvent extends Equatable {
  const ExperienceEvent();

  @override
  List<Object> get props => [];
}

class LoadExperiences extends ExperienceEvent {}

// States
abstract class ExperienceState extends Equatable {
  const ExperienceState();

  @override
  List<Object> get props => [];
}

class ExperienceInitial extends ExperienceState {}

class ExperienceLoading extends ExperienceState {}

class ExperienceLoaded extends ExperienceState {
  final List<Experience> experiences;

  const ExperienceLoaded(this.experiences);

  @override
  List<Object> get props => [experiences];
}

class ExperienceError extends ExperienceState {
  final String message;

  const ExperienceError(this.message);

  @override
  List<Object> get props => [message];
}

// BLoC
class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  final _experienceRepository = ExperienceRepositoryImpl();

  ExperienceBloc() : super(ExperienceInitial()) {
    on<LoadExperiences>(_onLoadExperiences);
  }

  Future<void> _onLoadExperiences(
      LoadExperiences event, Emitter<ExperienceState> emit) async {
    emit(ExperienceLoading());
    try {
      final experiences = await _experienceRepository.getExperiences();
      emit(ExperienceLoaded(experiences));
    } catch (e) {
      emit(ExperienceError(e.toString()));
    }
  }
}
