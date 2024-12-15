import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';
import 'package:task/common/common_button.dart';
import 'package:task/constants/app_asset.dart';
import 'package:task/constants/app_color.dart';
import 'package:task/constants/app_string.dart';
import 'package:task/utils/app_font.dart';
import 'package:task/utils/app_routes.dart';
import 'package:task/utils/extension.dart';
import 'package:task/utils/styles.dart';
import 'package:task/view/Question/provider/question_provider.dart';

import '../../common/header_image.dart';

class QuestionScreen extends ConsumerStatefulWidget {
  const QuestionScreen({super.key});

  @override
  ConsumerState<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends ConsumerState<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final questionData = ref.watch(questionScreenProvider);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///header image
            const HeaderImage(true),
            (h * 0.01).addHSpace(),

            ///question name and description

            questionName(h),
            (h * 0.02).addHSpace(),

            ///tab bar
            tabBar(questionData, w),
            (h * 0.015).addHSpace(),

            ///see all text
            seeAllText(context),
            (h * 0.015).addHSpace(),

            ///question list view
            questionListView(questionData, w, h),
            Spacer(),

            ///ask question button
            CommonButton(AppString.askQuestion, () {
              Navigator.pushNamed(context, Routes.addQuestionScreen);
            }, AppColors.blackColor),
            Platform.isIOS ? (h * 0.03).addHSpace() : (h * 0.02).addHSpace(),
          ],
        ),
      ),
    );
  }

  /// Q&A and see all
  Padding seeAllText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          AppString.qa
              .txt(style: poppins12w400.copyWith(fontSize: AppFontSize.font16)),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.replyScreen);
            },
            child: AppString.seeAll.txt(
                style: aDLaM16w400.copyWith(
                    fontSize: AppFontSize.font10, color: AppColors.appColor)),
          )
        ],
      ),
    );
  }

  ///question list view
  SizedBox questionListView(QuestionNotifier questionData, double w, double h) {
    return SizedBox(
      height: 320.h,
      child: ListView.builder(
        itemCount: questionData.questionList.length,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return listTile(w, h, questionData, index);
        },
      ),
    );
  }

  ///list tile
  Padding listTile(
      double w, double h, QuestionNotifier questionData, int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: SizedBox(
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
                  "@Student Name".txt(
                      style: poppins10w500.copyWith(
                          color: AppColors.whiteLight1Color)),
                  (h * 0.005).addHSpace(),
                  "${questionData.questionList[index]['name']}".txt(
                      style: afacad16w500.copyWith(
                          color: AppColors.blackColor,
                          fontSize: AppFontSize.font12,
                          height: (1.7).h)),
                  "${questionData.questionList[index]['answer']}".txt(
                      maxLine: 2,
                      style: aBeeZee16w400.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.whiteLight2Color,
                          fontSize: AppFontSize.font10,
                          height: (1.7).h)),
                  (h * 0.005).addHSpace(),
                  "2 ${AppString.replies}".txt(
                      style: aBeeZee16w400.copyWith(
                          color: AppColors.appColor,
                          fontSize: AppFontSize.font10)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///question name and description
  Padding questionName(double h) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Algebra 12: Functions 4".txt(style: aDLaM16w400),
          (h * 0.002).addHSpace(),
          ReadMoreText(
            'Most shocking news Most shocking Most shocking news Most shocking news Most shocking Most shocking news.',
            trimMode: TrimMode.Line,
            trimLines: 1,
            colorClickableText: Colors.pink,
            trimCollapsedText: 'more',
            trimExpandedText: 'less',
            style: poppins12w400,
            moreStyle: poppins12w800,
            lessStyle: poppins12w800,
          )
        ],
      ),
    );
  }

  ///tab bar
  Padding tabBar(QuestionNotifier questionData, double w) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            questionData.list.length,
            (index) {
              return Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: GestureDetector(
                  onTap: () {
                    questionData.setIndex(index);
                  },
                  child: Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: questionData.selectedIndex == index
                            ? Border.all(
                                color: AppColors.appLight1Color, width: 0.5)
                            : null,
                        color: questionData.selectedIndex == index
                            ? AppColors.appLightColor
                            : AppColors.whiteLightColor),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            questionData.list[index]['image'],
                            color: questionData.selectedIndex == index
                                ? AppColors.appColor
                                : AppColors.blackColor,
                          ),
                          (w * 0.008).addWSpace(),
                          questionData.list[index]['title'].toString().txt(
                              style: questionData.selectedIndex == index
                                  ? poppins10w600.copyWith(
                                      color: AppColors.appColor,
                                      fontSize: AppFontSize.font12)
                                  : poppins10w500.copyWith(
                                      fontSize: AppFontSize.font12))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
