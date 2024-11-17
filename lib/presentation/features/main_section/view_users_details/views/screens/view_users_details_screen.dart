import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:redoq/presentation/features/main_section/view_users_details/bloc/view_users_details_screen_bloc.dart';
import 'package:redoq/presentation/routes/route_names.dart';
import 'package:redoq/presentation/widgets/error_text_widget.dart';
import 'package:redoq/presentation/widgets/redoq_app_bar.dart';
import 'package:redoq/presentation/features/main_section/view_users_details/views/widgets/user_details_expansion_tile_widget.dart';
import 'package:redoq/presentation/features/main_section/view_users_details/views/widgets/user_details_screen_appbar_expand_button.dart';
import 'package:redoq/utils/constants/paddings.dart';
import 'package:redoq/utils/constants/sized_boxes.dart';

class ViewUserDetailsScreen extends StatefulWidget {
  const ViewUserDetailsScreen({super.key});

  @override
  State<ViewUserDetailsScreen> createState() => _ViewUserDetailsScreenState();
}

class _ViewUserDetailsScreenState extends State<ViewUserDetailsScreen> {
  @override
  void initState() {
    context.read<ViewUsersDetailsScreenBloc>().add(FetchUsersDetailsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RedoqAppBar(
          title: 'Your Details',
          actions: [UserDetailsScreenAppBarExpandButton()]),
      body:
          BlocConsumer<ViewUsersDetailsScreenBloc, ViewUsersDetailsScreenState>(
        listenWhen: (previous, current) =>
            current is ViewUsersDetailsScreenActionState,
        buildWhen: (previous, current) =>
            current is! ViewUsersDetailsScreenActionState,
        listener: (context, state) {
          if (state is EditButtonClickedState) {
            context.pushNamed(RedoqRouteNames.updateUserDetailsScreen,
                pathParameters: {'userId': state.userId});
          }
        },
        builder: (context, state) {
          if (state is UserDetailsFetchedState) {
            return ListView.separated(
                padding: listPadding,
                itemBuilder: (context, index) {
                  return UserDetailsExpansionTileWidget(
                      user: state.users[index]);
                },
                separatorBuilder: (context, index) {
                  return sizedBoxHeight18;
                },
                itemCount: state.users.length);
          } else if (state is SomethingWentWrongState) {
            return Center(child: ErrorText(error: state.error));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
