import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/utils/extension.dart';

import '../../../constants/app_asset.dart';
import '../../../constants/app_color.dart';
import '../../../utils/styles.dart';

class HeaderImage extends ConsumerStatefulWidget {
  final bool isShow;
  const HeaderImage(this.isShow, {super.key});

  @override
  ConsumerState<HeaderImage> createState() => _HeaderImageState();
}

class _HeaderImageState extends ConsumerState<HeaderImage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          height: 200.h,
          width: w,
          child: Image.asset(
            AppAssets.image,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  AppAssets.leftArrow,
                  height: 26.h,
                  width: 26.h,
                  fit: BoxFit.fill,
                ),
              ),
              const Spacer(),
              widget.isShow == true
                  ? Container(
                      height: 23.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.greyDarkColor.withOpacity(0.5)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.profile,
                              height: 14.h,
                              width: 14.h,
                              fit: BoxFit.fill,
                            ),
                            "37.8k".txt(
                                style: poppins10w500.copyWith(
                                    color: AppColors.whiteColor)),
                          ],
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        )
      ],
    );
  }
}
