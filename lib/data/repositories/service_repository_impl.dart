import 'package:professional_profile/domain/entities/service.dart';
import 'package:professional_profile/domain/repositories/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  @override
  Future<List<Service>> getServices() async {
    return const [
      Service(
        id: '1',
        title: 'Flutter Development',
        description:
            'Expert in building high-performance, cross-platform mobile applications using Flutter. '
            'Specializing in creating beautiful, responsive UIs and implementing complex business logic '
            'with clean architecture principles.',
        iconName: 'flutter_dash',
      ),
      Service(
        id: '2',
        title: 'Full-Stack Web Development',
        description:
            'End-to-end web application development using modern technologies like Laravel , Node Js and Bootstrap '
            'Focus on creating scalable, secure, and maintainable solutions with excellent user experience.',
        iconName: 'web',
      ),
      Service(
        id: '3',
        title: 'API Development & Integration',
        description:
            'Design and implementation of RESTful APIs and microservices. '
            'Experience with third-party API integration, authentication, and real-time data synchronization '
            'using Firebase and WebSocket.',
        iconName: 'api',
      ),
      Service(
        id: '4',
        title: 'UI/UX Design',
        description:
            'Creating intuitive and engaging user interfaces with modern design principles. '
            'Expertise in responsive design, animation, and accessibility standards '
            'to deliver exceptional user experiences.',
        iconName: 'design_services',
      ),
      Service(
        id: '5',
        title: 'Performance Optimization',
        description:
            'Optimization of application performance through code analysis, profiling, and implementation '
            'of best practices. Experience in reducing load times and improving app responsiveness.',
        iconName: 'speed',
      ),
    ];
  }
}
