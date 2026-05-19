import 'package:skillsync/barrel_file.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CSDrawer extends StatelessWidget {
  const CSDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    SSTextTheme textTheme = sl.themeCubit.state.main.theme.textStyles;
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              trailing: const Icon(Icons.close),
              title: Text('Menu', style: textTheme.text3),
              onTap: () => Navigator.pop(context),
            ),
            const Divider(),
            menuItem(
              'PlaceHolder',
              () {},
              LucideIcons.activity,
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItem(String label, Function() onTap, IconData icon) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 48,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(icon, size: 20),
              const SizedBox(width: 16),
              Text(label, style: sl.themeCubit.state.main.theme.textStyles.text3),
              const Spacer(),
              Icon(Icons.arrow_forward, color: sl.themeCubit.state.main.theme.colorTheme.icon.withValues(alpha: 0.6)),
            ],
          ),
        ),
      ),
    );
  }
}
