import 'package:flutter/material.dart';
import 'package:redoq/presentation/main_section/view_users_section/views/widgets/app_bar_title_widget.dart';

class RedoqAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool? hasBackButton;

  const RedoqAppBar(
      {super.key, required this.title, this.actions, this.hasBackButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppbarTitleWidget(title: title),
      titleSpacing: hasBackButton == true ? 0 : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
