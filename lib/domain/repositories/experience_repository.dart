import 'package:professional_profile/domain/entities/experience.dart';

abstract class ExperienceRepository {
  Future<List<Experience>> getExperiences();
}
