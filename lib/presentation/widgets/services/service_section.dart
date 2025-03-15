import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:professional_profile/core/utils/responsive_utils.dart';
import 'package:professional_profile/presentation/widgets/common/section_title.dart';
import 'package:professional_profile/presentation/widgets/services/service_grid.dart';
import 'package:professional_profile/presentation/bloc/services_bloc.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32.0),
      color: Colors.grey[100],
      child: Column(
        children: [
          const SectionTitle(title: 'Services'),
          const SizedBox(height: 32),
          SizedBox(
            width: ResponsiveUtils.getContentWidth(context),
            child: BlocBuilder<ServicesBloc, ServicesState>(
              builder: (context, state) {
                if (state is ServicesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ServicesLoaded) {
                  return ServiceGrid(services: state.services);
                }
                if (state is ServicesError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
