import 'package:professional_profile/domain/entities/experience.dart';
import 'package:professional_profile/domain/repositories/experience_repository.dart';

class ExperienceRepositoryImpl extends ExperienceRepository {
  @override
  Future<List<Experience>> getExperiences() async {
    // Simulating API call
    await Future.delayed(const Duration(seconds: 1));

    return [
      Experience(
        companyName: 'Tech Solutions Inc.',
        companyLogo: 'https://example.com/tech_solutions_logo.png',
        positions: [
          Position(
            title: 'Senior Software Engineer',
            duration: 'Jan 2020 - Present',
            responsibilities: [
              'Lead development of cloud-based applications',
              'Mentor junior developers and conduct code reviews',
              'Implement CI/CD pipelines for streamlined deployments',
            ],
          ),
          Position(
            title: 'Software Engineer',
            duration: 'Jun 2018 - Dec 2019',
            responsibilities: [
              'Developed and maintained web applications using React and Node.js',
              'Collaborated with cross-functional teams to deliver high-quality software',
              'Optimized database queries for improved performance',
            ],
          ),
        ],
      ),
      Experience(
        companyName: 'Innovative Startup',
        companyLogo: 'https://example.com/innovative_startup_logo.png',
        positions: [
          Position(
            title: 'Full Stack Developer',
            duration: 'Sep 2016 - May 2018',
            responsibilities: [
              'Built and launched MVP for a social media analytics platform',
              'Implemented RESTful APIs using Django and PostgreSQL',
              'Integrated third-party services for data processing and visualization',
            ],
          ),
        ],
      ),
    ];
  }
}
