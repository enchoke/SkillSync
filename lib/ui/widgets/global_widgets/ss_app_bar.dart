import 'package:skillsync/barrel_file.dart';
import 'package:flutter/material.dart';

class SSAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final bool showLeading;

  const SSAppBar({
    super.key,
    required this.title,
    this.leading,
    this.showLeading = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: showLeading
            ? (leading != null)
                ? leading
                : IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => NavigationV2.showHomeScreen(context),
                    icon: const Icon(Icons.arrow_back),
                  )
            : const SizedBox(),
        title: Text(title, style: sl.themeCubit.state.main.theme.textStyles.text1B),
        centerTitle: true,
        titleTextStyle: sl.themeCubit.state.main.theme.textStyles.text1,
      ),
    );
  }
}
