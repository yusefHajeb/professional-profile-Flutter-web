import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:professional_profile/core/utils/responsive_utils.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_in.dart';
import 'package:professional_profile/presentation/widgets/common/section_title.dart';
import 'package:professional_profile/presentation/widgets/services/service_grid.dart';
import 'package:professional_profile/presentation/bloc/services_bloc.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          const SectionTitle(title: 'Services'),
          const SizedBox(height: 16),
          AnimatedFadeIn(
            delay: const Duration(milliseconds: 300),
            child: Text(
              'Specialized solutions to meet your digital needs',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.grey[700],
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: ResponsiveUtils.getContentWidth(context),
            child: BlocBuilder<ServicesBloc, ServicesState>(
              builder: (context, state) {
                if (state is ServicesLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: theme.primaryColor,
                    ),
                  );
                }
                if (state is ServicesLoaded) {
                  return ServiceGrid(services: state.services);
                }
                if (state is ServicesError) {
                  return Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: theme.colorScheme.error,
                          size: 48,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.message,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: theme.colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  );
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
