import 'package:flutter/material.dart';
import 'package:redoq/data/data_sources/local_data_sources.dart';
import 'package:redoq/presentation/widgets/redoq_app_bar.dart';
import 'package:redoq/presentation/features/main_section/view_users_section/views/widgets/user_details_expansion_tile_widget.dart';
import 'package:redoq/presentation/features/main_section/view_users_section/views/widgets/user_details_screen_appbar_expand_button.dart';
import 'package:redoq/utils/constants/paddings.dart';
import 'package:redoq/utils/constants/sized_boxes.dart';

class ViewUserDetailsScreen extends StatelessWidget {
  const ViewUserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RedoqAppBar(
          title: 'Your Details',
          actions: [UserDetailsScreenAppBarExpandButton()]),
      body: ListView.separated(
          padding: listPadding,
          itemBuilder: (context, index) {
            return UserDetailsExpansionTileWidget(
                user: LocalDataSources().getUsers[index]);
          },
          separatorBuilder: (context, index) {
            return sizedBoxHeight18;
          },
          itemCount: LocalDataSources().getUsers.length),
    );
  }
}
