import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redoq/config/routes/route_names.dart';
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
        backgroundColor: lightThemeBackgroundColor,
        collapsedBackgroundColor: lightThemeBackgroundColor,
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
                    color: lightThemeSubTextColor,
                    fontWeight: FontWeight.w500)),
            Text('${widget.user.userAge} years old',
                style: TextStyle(
                    fontSize: 14.5.sp,
                    letterSpacing: 0,
                    color: descriptionTextColor,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                context.pushNamed(RedoqRouteNames.updateUserDetailsScreen,
                    pathParameters: {'userId': widget.user.userId});
              },
              icon: Image.asset('assets/edit.png', height: 18),
            ),
            IconButton(
                onPressed: () {
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
                icon: AnimatedSwitcher(
                  duration: Durations.short2,
                  switchInCurve: Curves.linear,
                  child: Icon(
                      key: ValueKey(isExpanded),
                      isExpanded
                          ? Icons.expand_less_rounded
                          : Icons.expand_more_rounded,
                      size: 28,
                      color: lightThemeTextColor),
                )),
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
