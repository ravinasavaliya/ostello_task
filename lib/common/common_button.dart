import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/utils/extension.dart';

import '../utils/app_font.dart';
import '../utils/styles.dart';

class CommonButton extends ConsumerStatefulWidget {
  final String title;
  final Color color;
  final Function() onTap;
  const CommonButton(this.title, this.onTap, this.color, {super.key});

  @override
  ConsumerState<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends ConsumerState<CommonButton> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 42.h,
          width: w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: widget.color)),
          child: Center(
            child: widget.title.txt(
                style: aBeeZee16w400.copyWith(
                    fontSize: AppFontSize.font14, color: widget.color)),
          ),
        ),
      ),
    );
  }
}
