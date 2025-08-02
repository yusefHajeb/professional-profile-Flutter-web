import 'package:flutter/material.dart';
import 'package:professional_profile/core/utils/responsive_utils.dart';
import 'package:professional_profile/domain/entities/service.dart';
import 'package:professional_profile/presentation/widgets/services/service_card.dart';

class ServiceGrid extends StatelessWidget {
  final List<Service> services;

  const ServiceGrid({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = ResponsiveUtils.getCrossAxisCount(screenWidth);
    final childAspectRatio = ResponsiveUtils.getChildAspectRatio(screenWidth);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
      itemCount: services.length,
      itemBuilder: (context, i) => ServiceCard(service: services[i], index: i),
    );
  }
}
