import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:professional_profile/core/theme/cubit/theme_cubit.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_in.dart';
import 'package:professional_profile/presentation/widgets/common/animated_fade_scale.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeScale(
      child: Card(
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadiusGeometry.circular(32.0.r),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return AnimatedFadeIn(
                delay: Duration(milliseconds: 550),
                child: IconButton(
                  onPressed: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  icon: Icon(
                    state.themeMode == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
