import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redoq/presentation/features/main_section/view_users_details/bloc/view_users_details_screen_bloc.dart';
import 'package:redoq/model/entities/user_model.dart';
import 'package:redoq/utils/constants/colors.dart';
import 'package:redoq/utils/constants/sized_boxes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserDetailsExpansionTileWidget extends StatefulWidget {
  final UserModel user;
  const UserDetailsExpansionTileWidget({super.key, required this.user});

  @override
  State<UserDetailsExpansionTileWidget> createState() =>
      _UserDetailsExpansionTileWidgetState();
}

class _UserDetailsExpansionTileWidgetState
    extends State<UserDetailsExpansionTileWidget> {
  bool isExpanded = false;
  bool isGrandChild = false;
  final expansionTileController = ExpansionTileController();

  @override
  void initState() {
    final userHierarchy = widget.user.userId.split('.');
    if (userHierarchy[1] != '0') {
      isGrandChild = true;
    } else {
      isGrandChild = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Adaptive.w(100),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor)),
      child: ExpansionTile(
        controller: expansionTileController,
        tilePadding:
            const EdgeInsets.only(top: 3, bottom: 3, left: 17, right: 5),
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.transparent)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.transparent)),
        backgroundColor: backgroundColor,
        collapsedBackgroundColor: backgroundColor,
        onExpansionChanged: (value) {
          if (widget.user.child != null) {
            setState(() {
              isExpanded = !isExpanded;
            });
          }
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.user.userName,
                style: TextStyle(
                    fontSize: 16.sp,
                    letterSpacing: 0,
                    color: subTextColor,
                    fontWeight: FontWeight.w500)),
            Text('${widget.user.userAge} Years Old',
                style: TextStyle(
                    fontSize: 14.3.sp,
                    letterSpacing: 0,
                    color: descriptionTextColor,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  context
                      .read<ViewUsersDetailsScreenBloc>()
                      .add(EditButtonClickedEvent(userId: widget.user.userId));
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.5),
                  child: Image.asset('assets/edit.png', height: 17),
                )),
            InkWell(
              onTap: () {
                if (widget.user.child != null) {
                  setState(() {
                    if (expansionTileController.isExpanded) {
                      expansionTileController.collapse();
                      isExpanded = false;
                    } else {
                      expansionTileController.expand();
                      isExpanded = true;
                    }
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(4.5),
                child: AnimatedSwitcher(
                  duration: Durations.short2,
                  switchInCurve: Curves.linear,
                  child: Icon(
                      key: ValueKey(isExpanded),
                      isExpanded
                          ? Icons.expand_less_rounded
                          : Icons.expand_more_rounded,
                      size: 27,
                      color: textColor),
                ),
              ),
            )
          ],
        ),
        children: widget.user.child != null
            ? [
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: isGrandChild
                        ? const EdgeInsets.only(
                            left: 6.5, right: 6.5, bottom: 22, top: 8)
                        : const EdgeInsets.only(
                            left: 17, right: 17, bottom: 18, top: 8),
                    itemBuilder: (context, index) {
                      return UserDetailsExpansionTileWidget(
                          user: widget.user.child![index]);
                    },
                    separatorBuilder: (context, index) {
                      return sizedBoxHeight18;
                    },
                    itemCount: widget.user.child!.length)
              ]
            : [],
      ),
    );
  }
}
