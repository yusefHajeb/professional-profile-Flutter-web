import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:professional_profile/config/app_config.dart';
import 'package:professional_profile/domain/entities/service.dart';
import 'package:professional_profile/domain/repositories/service_repository.dart';

// Events
abstract class ServicesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadServices extends ServicesEvent {}

// States
abstract class ServicesState extends Equatable {
  @override
  List<Object> get props => [];
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  final List<Service> services;

  ServicesLoaded(this.services);

  @override
  List<Object> get props => [services];
}

class ServicesError extends ServicesState {
  final String message;

  ServicesError(this.message);

  @override
  List<Object> get props => [message];
}

// Bloc
class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ServiceRepository _serviceRepository = getIt<ServiceRepository>();

  ServicesBloc() : super(ServicesInitial()) {
    on<LoadServices>((event, emit) async {
      emit(ServicesLoading());
      try {
        final services = await _serviceRepository.getServices();
        emit(ServicesLoaded(services));
      } catch (e) {
        emit(ServicesError(e.toString()));
      }
    });
  }
}
