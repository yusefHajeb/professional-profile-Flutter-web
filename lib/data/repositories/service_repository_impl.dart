import 'package:professional_profile/domain/entities/service.dart';
import 'package:professional_profile/domain/repositories/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  @override
  Future<List<Service>> getServices() async {
    return const [
      Service(
        id: '1',
        title: 'Web Development',
        description:
            'Modern and responsive web applications using Flutter and React',
        iconName: 'web',
      ),
      Service(
        id: '2',
        title: 'Mobile Development',
        description:
            'Cross-platform mobile applications with Flutter and React Native',
        iconName: 'mobile_friendly',
      ),
      Service(
        id: '3',
        title: 'Backend Development',
        description:
            'Scalable and secure backend solutions using Node.js and Firebase',
        iconName: 'cloud',
      ),
      Service(
        id: '4',
        title: 'UI/UX Design',
        description:
            'Beautiful and intuitive user interfaces with modern design principles',
        iconName: 'design_services',
      ),
    ];
  }
}
