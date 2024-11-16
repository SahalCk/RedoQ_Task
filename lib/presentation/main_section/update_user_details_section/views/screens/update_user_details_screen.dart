import 'package:flutter/material.dart';
import 'package:redoq/presentation/main_section/update_user_details_section/views/widgets/textform_field_with_title_widget.dart';
import 'package:redoq/presentation/main_section/view_users_section/views/widgets/redoq_app_bar.dart';
import 'package:redoq/utils/constants/colors.dart';
import 'package:redoq/utils/constants/paddings.dart';
import 'package:redoq/utils/constants/sized_boxes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UpdateUserDetailsScreen extends StatefulWidget {
  final String userId;
  const UpdateUserDetailsScreen({super.key, required this.userId});

  @override
  State<UpdateUserDetailsScreen> createState() =>
      _UpdateUserDetailsScreenState();
}

class _UpdateUserDetailsScreenState extends State<UpdateUserDetailsScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
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
          child: Column(
            children: [
              sizedBoxHeight25,
              TextFormFieldWithTitleWidget(
                  controller: nameController,
                  title: 'Name',
                  hint: 'Enter your name'),
              sizedBoxHeight30,
              TextFormFieldWithTitleWidget(
                  controller: ageController,
                  title: 'Age',
                  hint: 'Enter your age',
                  textInputType: TextInputType.number,
                  isLast: true)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: defaultPadding,
        child: SizedBox(
          height: 56,
          width: Adaptive.w(100),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 18.sp),
              )),
        ),
      ),
    );
  }
}
