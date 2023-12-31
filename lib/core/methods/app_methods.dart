import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppMethods{
  static showFlexibleSizeBottomSheet({
    required Widget widget,
    required BuildContext context,
    bool isScrollable = true,
  }) {
    var AppColors;
    return showModalBottomSheet(
      backgroundColor: AppColors.appBgColor,
      isScrollControlled: isScrollable,
      constraints: BoxConstraints(maxHeight: 0.70.sh),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: widget,
      ),
    );
  }
}