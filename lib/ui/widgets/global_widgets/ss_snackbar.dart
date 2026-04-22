import 'package:skillsync/barrel_file.dart';
import 'package:flutter/material.dart';

class CSSnackBar {
  final String message;
  final int duration;
  final Widget? icon;
  final bool isError;
  OverlayEntry? _overlayEntry;

  CSSnackBar({
    required this.message,
    this.duration = 3,
    this.icon,
    this.isError = false,
  });

  void show(BuildContext context) {
    _overlayEntry = _createOverlayEntry(context);
    Overlay.of(context).insert(_overlayEntry!);
    Future.delayed(Duration(seconds: duration), () {
      _overlayEntry?.remove();
    });
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    AppTheme theme = sl.themeCubit.state.main.theme;
    SSTheme colors = theme.colorTheme;
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 10,
        right: 10,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isError ? colors.error : colors.green,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: theme.textStyles.text4,
                  ),
                ),
                if (icon != null) icon!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
