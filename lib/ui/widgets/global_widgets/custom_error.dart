import 'package:skillsync/barrel_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomError({
    super.key,
    required this.errorDetails,
  });

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = sl.themeCubit.state.main;
    SSTextTheme textTheme = themeState.theme.textStyles;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 200, child: Lottie.asset('assets/lottie/404.json')),
            Text(
              kDebugMode ? errorDetails.summary.toString() : 'Oops! Something went wrong!',
              textAlign: TextAlign.center,
              style: textTheme.text4ER,
            ),
            const SizedBox(height: 12),
            Text(
              "We encountered an error and we've notified our engineering team about it. \nSorry for the inconvenience caused.",
              textAlign: TextAlign.center,
              style: textTheme.text4,
            ),
          ],
        ),
      ),
    );
  }
}
