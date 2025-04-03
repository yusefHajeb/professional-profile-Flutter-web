import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:professional_profile/domain/entities/service.dart';
import 'package:professional_profile/data/repositories/service_repository_impl.dart';

// Events
abstract class ServicesEvent {}

class LoadServices extends ServicesEvent {}

// States
abstract class ServicesState {}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  final List<Service> services;

  ServicesLoaded(this.services);
}

class ServicesError extends ServicesState {
  final String message;

  ServicesError(this.message);
}

// Bloc
class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final _repository = ServiceRepositoryImpl();

  ServicesBloc() : super(ServicesInitial()) {
    on<LoadServices>((event, emit) async {
      emit(ServicesLoading());
      try {
        final services = await _repository.getServices();
        emit(ServicesLoaded(services));
      } catch (e) {
        emit(ServicesError('Failed to load services: $e'));
      }
    });
  }
}
