import 'package:professional_profile/domain/entities/experience.dart';
import 'package:professional_profile/domain/repositories/experience_repository.dart';

class ExperienceRepositoryImpl extends ExperienceRepository {
  @override
  Future<List<Experience>> getExperiences() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Experience(
        companyName: 'Rafal Store',
        companyLogo: 'https://example.com/tech_solutions_logo.png',
        positions: [
          Position(
            title: 'Full-Stack Mobile Developer | Flutter -Laravel',
            duration: 'Feb 2025 - Jul 2025',
            responsibilities: [
              'Architect, develop, and maintain full-stack features, from design to production.',
              'Design and develop RESTful APIs & third-party integrations.',
              'Integrate front-end components with backend APIs and data services.',
            ],
          ),
          Position(
            title: 'Flutter Developer',
            duration: 'Sep 2023 - Feb 2025',
            responsibilities: [
              'Contribute to building and developing an ERP system that streamlined sales and delivery workflows, accelerating task completion by 90% and improving data accuracy.',
              'Assisted in creating a dynamic application that served as a semi-integrated system, delivered in a short time frame.',
              'Developed an application to manage order production processes and automate tasks, enhancing the sales and delivery process.',
              'Created a custom UI/UX design for the mobile application.'
            ],
          ),
        ],
      ),
      Experience(
        companyName: 'Self-',
        companyLogo: 'https://example.com/innovative_startup_logo.png',
        positions: [
          Position(
            title: 'Flutter Freelancer Developer ',
            duration: 'Feb 2023 - Sep 2023',
            responsibilities: [
              'Implemented Firebase backend for user data management and analytics',
              'Implemented RESTful APIs using Django and PostgreSQL',
              'Integrated third-party services for data processing and visualization',
            ],
          ),
        ],
      ),
    ];
  }
}
