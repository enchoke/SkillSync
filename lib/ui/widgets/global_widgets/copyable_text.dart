import 'dart:async';

import 'package:skillsync/barrel_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CopyableText extends StatefulWidget {
  final String copyText;
  final double? iconSize;
  final Widget? child;
  final TextStyle? copyTheme;

  const CopyableText({
    super.key,
    required this.copyText,
    this.iconSize,
    this.child,
    this.copyTheme,
  });

  @override
  State<CopyableText> createState() => _CopyableTextState();
}

class _CopyableTextState extends State<CopyableText> {
  bool copied = false;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: widget.copyText));
        HapticFeedback.heavyImpact();
        setState(() {
          copied = true;
          _timer?.cancel();
          _timer = Timer(
            const Duration(seconds: 1),
            () => setState(() => copied = false),
          );
        });
      },
      child: copied ? Text('Copied!', style: widget.copyTheme ?? sl.themeCubit.state.main.theme.textStyles.text4B) : widget.child ?? SvgPicture.asset('assets/icons/copy.svg', width: widget.iconSize ?? 20, height: widget.iconSize ?? 20),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
