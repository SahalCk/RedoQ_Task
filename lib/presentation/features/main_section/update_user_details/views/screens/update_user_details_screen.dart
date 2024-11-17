// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:redoq/model/entities/user_model.dart';
import 'package:redoq/presentation/features/main_section/update_user_details/bloc/update_user_details_screen_bloc.dart';
import 'package:redoq/presentation/features/main_section/update_user_details/views/widgets/textform_field_with_title_widget.dart';
import 'package:redoq/presentation/features/main_section/view_users_details/bloc/view_users_details_screen_bloc.dart';
import 'package:redoq/presentation/widgets/redoq_app_bar.dart';
import 'package:redoq/presentation/widgets/redoq_loading_button.dart';
import 'package:redoq/presentation/widgets/snack_bar_widgets.dart';
import 'package:redoq/utils/constants/paddings.dart';
import 'package:redoq/utils/constants/sized_boxes.dart';

class UpdateUserDetailsScreen extends StatefulWidget {
  final String userId;
  const UpdateUserDetailsScreen({super.key, required this.userId});

  @override
  State<UpdateUserDetailsScreen> createState() =>
      _UpdateUserDetailsScreenState();
}

class _UpdateUserDetailsScreenState extends State<UpdateUserDetailsScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late final UpdateUserDetailsScreenBloc _updateScreenBloc;
  UserModel? _user;

  @override
  void initState() {
    _updateScreenBloc = context.read<UpdateUserDetailsScreenBloc>();
    _updateScreenBloc.add(PresetUserDetailsEvent(userId: widget.userId));
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const RedoqAppBar(title: 'Update', hasBackButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: defaultPadding,
          child: BlocConsumer<UpdateUserDetailsScreenBloc,
              UpdateUserDetailsScreenState>(
            listenWhen: (previous, current) =>
                current is UpdateUserDetailsScreenActionState,
            buildWhen: (previous, current) =>
                current is! UpdateUserDetailsScreenActionState,
            listener: (context, state) {
              if (state is UserDetailsUpdateSuccessState) {
                RedoqSnackBarWidgets().successSnackBar(
                    context, 'User details updated successfully');
                context
                    .read<ViewUsersDetailsScreenBloc>()
                    .add(FetchUsersDetailsEvent());
                context.pop();
              } else if (state is UserDetailsUpdateFailedState) {
                RedoqSnackBarWidgets().errorSnackBar(context, state.error);
              }
            },
            builder: (context, state) {
              if (state is UserDetailsPresetState) {
                _user = state.userModel;
                _nameController.text = state.userModel.userName;
                _ageController.text = state.userModel.userAge;
              }
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    sizedBoxHeight25,
                    TextFormFieldWithTitleWidget(
                        controller: _nameController,
                        title: 'Name',
                        hint: 'Enter your name'),
                    sizedBoxHeight30,
                    TextFormFieldWithTitleWidget(
                        controller: _ageController,
                        title: 'Age',
                        hint: 'Enter your age',
                        textInputType: TextInputType.number,
                        isLast: true)
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: defaultPadding,
        child: RedoqLoadingButton(
          text: 'Submit',
          onPressed: (startLoading, stopLoading, buttonState) async {
            if (_formKey.currentState!.validate()) {
              startLoading();
              await Future.delayed(Durations.medium3);
              _updateScreenBloc.add(UpdateUserDetailsEvent(
                  name: _nameController.text,
                  age: _ageController.text,
                  userId: _user!.userId));
              stopLoading();
            }
          },
        ),
      ),
    );
  }
}
