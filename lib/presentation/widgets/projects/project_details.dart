import 'package:flutter/material.dart';
import 'package:professional_profile/domain/entities/project.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_scale.dart';
import 'package:professional_profile/presentation/widgets/common/hover_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProjectDetails extends StatelessWidget {
  final Project project;

  const ProjectDetails({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageCarousel(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProjectTitle(context),
                  const SizedBox(height: 16),
                  _buildProjectDescription(context),
                  const SizedBox(height: 24),
                  _buildTechnologiesUsed(context),
                  const SizedBox(height: 24),
                  _buildKeyFeatures(context),
                  const SizedBox(height: 24),
                  _buildChallengesAndSolutions(context),
                  const SizedBox(height: 24),
                  _buildProjectLinks(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        autoPlay: true,
      ),
      items: project.images.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildProjectTitle(BuildContext context) {
    return AnimatedFadeScale(
      child: Text(
        project.title,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }

  Widget _buildProjectDescription(BuildContext context) {
    return AnimatedFadeScale(
      child: Text(
        project.description,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  Widget _buildTechnologiesUsed(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Technologies Used',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: project.technologies
              .map((tech) => Chip(
                    label: Text(tech),
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildKeyFeatures(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Features',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Column(
          children: project.keyFeatures
              .map((feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle,
                            color: Theme.of(context).primaryColor, size: 20),
                        const SizedBox(width: 8),
                        Expanded(child: Text(feature)),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildChallengesAndSolutions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Challenges and Solutions',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(project.challengesAndSolutions),
      ],
    );
  }

  Widget _buildProjectLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Project Links',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            if (project.githubUrl != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: HoverButton(
                  onPressed: () => _launchURL(project.githubUrl!),
                  child: Text('GitHub'),
                  color: Theme.of(context).primaryColor,
                  hoverColor: Theme.of(context).primaryColor.withOpacity(0.8),
                ),
              ),
            if (project.liveUrl != null)
              HoverButton(
                onPressed: () => _launchURL(project.liveUrl!),
                child: Text('Live Demo'),
                color: Theme.of(context).primaryColor,
                hoverColor: Theme.of(context).primaryColor.withOpacity(0.8),
              ),
          ],
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
