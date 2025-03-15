import 'package:professional_profile/domain/entities/service.dart';

abstract class ServiceRepository {
  Future<List<Service>> getServices();
}
