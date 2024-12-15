import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/utils/extension.dart';
import 'package:task/view/Reply/provider/reply_provider.dart';

import '../../common/header_image.dart';
import '../../constants/app_asset.dart';
import '../../constants/app_color.dart';
import '../../constants/app_string.dart';
import '../../utils/app_font.dart';
import '../../utils/styles.dart';

class ReplyScreen extends ConsumerStatefulWidget {
  const ReplyScreen({super.key});

  @override
  ConsumerState<ReplyScreen> createState() => _ReplyScreenState();
}

class _ReplyScreenState extends ConsumerState<ReplyScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final replyData = ref.watch(replyScreenProvider);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              ///header image
              const HeaderImage(false),
              (h * 0.01).addHSpace(),

              ///question and back text

              questionText(context),
              (h * 0.015).addHSpace(),

              ///divider
              divider(),
              (h * 0.02).addHSpace(),

              ///question widget
              questionWidget(w, h),
              (h * 0.017).addHSpace(),

              ///reply list data
              replyListData(replyData, w, h),
              const Spacer(),

              ///reply text field
              replyTextField(w),
              Platform.isIOS ? (h * 0.03).addHSpace() : (h * 0.02).addHSpace(),
            ],
          )),
    );
  }

  ///reply text field
  Container replyTextField(double w) {
    return Container(
      height: 49.h,
      width: w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Row(
          children: [
            Container(
              width: 281.w,
              child: TextField(
                style: aBeeZee16w400.copyWith(
                    fontSize: AppFontSize.font14,
                    color: AppColors.blackLightColor),
                cursorColor: AppColors.blackColor,
                decoration: InputDecoration(
                    hintText: AppString.writeReply,
                    hintStyle: aBeeZee16w400.copyWith(
                        fontSize: AppFontSize.font14,
                        color: AppColors.blackLightColor),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide:
                            BorderSide(color: AppColors.blackLightColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.whiteLight3Color, width: 0.5))),
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              AppAssets.send,
              height: 48.h,
              width: 48.h,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }

  ///reply list data
  Padding replyListData(ReplyNotifier replyData, double w, double h) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Container(
        height: 235.h,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: replyData.replyList.length,
          itemBuilder: (context, index) {
            return listTile(w, replyData, index, h);
          },
        ),
      ),
    );
  }

  ///list tile
  Padding listTile(double w, ReplyNotifier replyData, int index, double h) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            AppAssets.man,
            height: 34.h,
            width: 34.h,
            fit: BoxFit.fill,
          ),
          (w * 0.025).addWSpace(),
          Container(
            width: 272.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                replyData.replyList[index]['title'].toString().txt(
                    style: aBeeZee16w400.copyWith(
                        color: AppColors.whiteLight2Color,
                        fontSize: AppFontSize.font10,
                        height: (1.7).h)),
                (h * 0.005).addHSpace(),
                Row(
                  children: [
                    replyData.replyList[index]['name'].toString().txt(
                        style: aBeeZee16w400.copyWith(
                            fontSize: AppFontSize.font10)),
                    replyData.replyList[index]['date'].toString().txt(
                        style: aBeeZee16w400.copyWith(
                            color: AppColors.whiteLight1Color,
                            fontSize: AppFontSize.font10)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  ///question widget
  Padding questionWidget(double w, double h) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppAssets.man,
            height: 34.h,
            width: 34.h,
            fit: BoxFit.fill,
          ),
          (w * 0.025).addWSpace(),
          Container(
            width: 272.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "How can the user click on different ads?".txt(
                    style: afacad16w500.copyWith(
                        color: AppColors.blackColor,
                        fontSize: AppFontSize.font12,
                        height: (1.7).h)),
                "I don’t understand one thing in this topic that how can a user click on this navigation bar and go on to next fieldBla avla and yupiiees please explain me the answer of my trignometary.\n\nThanks, Shahbaz"
                    .txt(
                        style: aBeeZee16w400.copyWith(
                            color: AppColors.whiteLight2Color,
                            fontSize: AppFontSize.font10,
                            height: (1.7).h)),
                (h * 0.005).addHSpace(),
                Row(
                  children: [
                    "Shahbaz Ali".txt(
                        style: aBeeZee16w400.copyWith(
                            fontSize: AppFontSize.font10)),
                    "  22 May 2020 Lecture 27".txt(
                        style: aBeeZee16w400.copyWith(
                            color: AppColors.whiteLight1Color,
                            fontSize: AppFontSize.font10)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  ///divider
  Divider divider() {
    return Divider(
      height: 0,
      thickness: 0.5,
      color: AppColors.whiteLight3Color,
    );
  }

  ///question and back text

  Padding questionText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: AppString.back.toString().txt(
                style: aBeeZee16w400.copyWith(fontSize: AppFontSize.font12)),
          ),
          Spacer(),
          AppString.questions
              .toString()
              .txt(style: aBeeZee16w400.copyWith(fontSize: AppFontSize.font14)),
          Spacer()
        ],
      ),
    );
  }
}
