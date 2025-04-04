import 'package:get_it/get_it.dart';
import 'package:professional_profile/data/repositories/project_repository_impl.dart';
import 'package:professional_profile/data/repositories/service_repository_impl.dart';
import 'package:professional_profile/domain/repositories/project_repository.dart';
import 'package:professional_profile/domain/repositories/service_repository.dart';
import '../data/repositories/experience_repository_impl.dart';
import '../domain/repositories/experience_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Repositories
  getIt.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(),
  );

  getIt.registerLazySingleton<ExperienceRepository>(
      () => ExperienceRepositoryImpl());
  getIt.registerLazySingleton<ServiceRepository>(
    () => ServiceRepositoryImpl(),
  );
}
