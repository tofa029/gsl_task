import 'package:flutter/material.dart';
import 'package:gsl_task/core/common/custom_container.dart';
import 'package:gsl_task/core/common/custom_text.dart';
import 'package:gsl_task/core/index.dart';

class CustomAppBar extends StatelessWidget {
  String title;
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
          Badge(
            label: CustomContainer(borderRadius: 20,child: CustomText(text: '5', color: CustomColors().white)),
            child: Icon(
              Icons.notifications_none_outlined,
              size: 35,
              color: CustomColors().color3B3B3B,
            ),
          ),

        ],
      ),
    );
  }
}
