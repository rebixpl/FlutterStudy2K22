// Packages
import 'package:flutter/material.dart';

class BrowserAppBar extends StatelessWidget with PreferredSizeWidget {
  const BrowserAppBar({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: const Text("potężna przeglądarka"),
      actions: [
        SearchbarConfirmationButton(
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearchbarConfirmationButton extends StatelessWidget {
  final Function() onTap;
  const SearchbarConfirmationButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Done",
              style: Theme.of(context).textTheme.button,
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
