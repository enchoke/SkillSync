import 'package:skillsync/barrel_file.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;

  const LoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color ?? sl.themeCubit.state.main.theme.colorTheme.textColors.body),
        strokeWidth: 3,
      ),
    );
  }
}
