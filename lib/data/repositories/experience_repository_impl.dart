import 'package:professional_profile/domain/entities/experience.dart';

class ExperienceRepositoryImpl {
  Future<List<Experience>> getExperiences() async {
    return const [
      Experience(
        id: '1',
        company: 'Google',
        position: 'Flutter Developer',
        duration: '2020 - 2021',
        description:
            'Developed and maintained high-performance mobile applications using Flutter framework.',
        achievements: [
          'Led the development of 3 major features that improved user engagement by 40%',
          'Optimized app performance resulting in 30% faster load times',
          'Collaborated with cross-functional teams to deliver projects ahead of schedule',
        ],
        technologies: ['Flutter', 'Dart', 'Firebase', 'REST APIs', 'Git'],
      ),
      Experience(
        id: '2',
        company: 'Tech Solutions Inc.',
        position: 'Full-Stack Developer',
        duration: '2021 - Present',
        description:
            'Leading full-stack development projects and mentoring junior developers.',
        achievements: [
          'Architected and implemented scalable solutions serving 100K+ users',
          'Reduced system downtime by 75% through improved error handling',
          'Introduced automated testing that increased code coverage to 90%',
        ],
        technologies: [
          'Flutter',
          'React',
          'Node.js',
          'MongoDB',
          'AWS',
          'Docker'
        ],
      ),
    ];
  }
}
