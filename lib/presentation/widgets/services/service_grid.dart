import 'package:flutter/material.dart';
import 'package:professional_profile/domain/entities/service.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_in.dart';

import '../../../config/responsive_layout_config.dart';
import 'service_card.dart';

class ServiceGrid extends StatelessWidget {
  final List<Service> services;

  const ServiceGrid({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GrideServise(
        service: services,
      );
    });
  }
}

class GrideServise extends StatelessWidget {
  final List<Service> service;
  const GrideServise({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    ResponsiveLayoutConfig().init(context);
    return ResponsiveLayoutConfig.responsive(
      mobile: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: service.length,
        itemBuilder: (context, index) => AnimatedFadeIn(
          delay: Duration(milliseconds: 300 + (index * 100)),
          child: ServiceCard(service: service[index]),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 1.2),
      ),
      tablet: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 1,
        ),
        itemCount: service.length,
        itemBuilder: (context, index) => AnimatedFadeIn(
          delay: Duration(milliseconds: 300 + (index * 100)),
          child: ServiceCard(service: service[index]),
        ),
      ),
      desktop: GridView.builder(
        shrinkWrap: true,
        itemCount: service.length,
        itemBuilder: (context, index) => AnimatedFadeIn(
          delay: Duration(milliseconds: 300 + (index * 100)),
          child: ServiceCard(service: service[index]),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          childAspectRatio: 1.5,
        ),
      ),
    );
  }
}
