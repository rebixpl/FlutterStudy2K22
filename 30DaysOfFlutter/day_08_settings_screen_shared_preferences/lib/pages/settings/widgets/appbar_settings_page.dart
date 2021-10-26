// Packages
import 'package:flutter/material.dart';

class SettingsScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const SettingsScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "User Settings",
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
