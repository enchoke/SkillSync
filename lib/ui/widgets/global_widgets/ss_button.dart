import 'package:skillsync/barrel_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CSButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final bool isLoading;
  final bool isSecondary;
  final bool isDisabled;
  final double maxWidth;

  const CSButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
    this.isSecondary = false,
    this.maxWidth = 400,
  });

  Widget _primaryStyle(BuildContext context, SSTheme colors) {
    return Align(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: kIsWeb ? maxWidth : double.infinity),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(colors.buttonRadius),
            color: colors.buttonPrimary,
          ),
          child: _buildButton(context, colors.buttonPrimary),
        ),
      ),
    );
  }

  Widget _secondaryStyle(BuildContext context, SSTheme colors) {
    return Align(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: kIsWeb ? maxWidth : double.infinity),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(colors.buttonRadius),
            color: (isDisabled || isLoading) ? colors.tileSecondary : colors.buttonSecondary,
            border: isDisabled || isLoading ? null : Border.all(color: colors.tile, width: 1),
          ),
          child: _buildButton(context, colors.buttonSecondary),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, Color hoverColor) {
    SSTextTheme style = sl.themeCubit.state.main.theme.textStyles;
    SSTheme colors = sl.themeCubit.state.main.theme.colorTheme;
    return ElevatedButton(
      onPressed: (isDisabled || isLoading) ? null : onPressed,
      child: Builder(
        builder: (context) {
          if (isLoading) return const SizedBox(height: 20, width: 20, child: CircularProgressIndicator());
          return Text(text, style: style.text3B.copyWith(color: colors.textColors.button));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SSTheme colors = sl.themeCubit.state.main.theme.colorTheme;
    return Builder(
      builder: (context) {
        if (isSecondary || isDisabled || isLoading) return _secondaryStyle(context, colors);
        return _primaryStyle(context, colors);
      },
    );
  }
}
