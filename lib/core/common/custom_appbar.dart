import 'package:flutter/material.dart';

import '../index.dart';


/// A custom app bar which extends stateless widget
/// This widget provides a title and an optional notification icon with a badge
/// It is wrapped inside a [CustomContainer] to ensure a consistent design


class CustomAppBar extends StatelessWidget {
  /// The title displayed in the app bar. required param
  final String title;

  /// Whether to show the notification icon with a badge
  /// Defaults to true, optional param
  bool showNotification;

  CustomAppBar({
    super.key,
    required this.title,
    this.showNotification = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 64,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomText(
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
          const Spacer(),
          if(showNotification)Badge(
            label: CustomContainer(borderRadius: 20,child: CustomText(text: '5', color: CustomColors().white, fontSize: 11,)),
            child: Icon(
              Icons.notifications_none_outlined,
              size: 25,
              color: CustomColors().color3B3B3B,
            ),
          ),

        ],
      ),
    );
  }
}
