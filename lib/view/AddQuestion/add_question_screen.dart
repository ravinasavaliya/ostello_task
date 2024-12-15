import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/common/common_button.dart';
import 'package:task/constants/app_color.dart';
import 'package:task/constants/app_string.dart';
import 'package:task/utils/app_font.dart';
import 'package:task/utils/extension.dart';
import 'package:task/view/AddQuestion/provider/add_question_provider.dart';

import '../../common/header_image.dart';
import '../../utils/styles.dart';
import '../Question/provider/question_provider.dart';

class AddQuestionScreen extends ConsumerStatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  ConsumerState<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends ConsumerState<AddQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final addQuestionData = ref.watch(addQuestionScreenProvider);
    final questionData = ref.watch(questionScreenProvider);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            ///header image
            const HeaderImage(true),
            (h * 0.01).addHSpace(),

            ///new question text
            newQuestionText(context),
            (h * 0.015).addHSpace(),

            ///divider
            divider(),
            (h * 0.02).addHSpace(),

            ///question box
            questionBox(w, addQuestionData),
            (h * 0.015).addHSpace(),

            ///title textField
            titleTextField(addQuestionData),
            (h * 0.015).addHSpace(),

            ///detail textField
            detailTextField(addQuestionData),
            const Spacer(),

            ///submit button
            submitButton(addQuestionData, questionData, context),
            Platform.isIOS ? (h * 0.03).addHSpace() : (h * 0.02).addHSpace(),
          ],
        ),
      ),
    );
  }

  ///submit button
  CommonButton submitButton(AddQuestionNotifier addQuestionData,
      QuestionNotifier questionData, BuildContext context) {
    return CommonButton(
        AppString.submit,
        addQuestionData.isShow == false
            ? () {}
            : () {
                questionData.addQuestion(
                    addQuestionData.title.text, addQuestionData.details.text);
                Navigator.pop(context);
              },
        addQuestionData.isShow == false
            ? AppColors.whiteLight2Color
            : AppColors.appColor);
  }

  ///detail textField
  TextField detailTextField(AddQuestionNotifier addQuestionData) {
    return TextField(
      controller: addQuestionData.details,
      onChanged: (value) {
        addQuestionData.showButtonColor();
      },
      style: aBeeZee16w400.copyWith(
          fontSize: AppFontSize.font14, color: AppColors.whiteLight2Color),
      cursorColor: AppColors.blackColor,
      decoration: InputDecoration(
          hintText: AppString.details,
          hintStyle: aBeeZee16w400.copyWith(
              fontSize: AppFontSize.font14, color: AppColors.whiteLight2Color),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          isDense: true,
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.whiteLight3Color, width: 0.5)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.whiteLight3Color, width: 0.5))),
    );
  }

  TextField titleTextField(AddQuestionNotifier addQuestionData) {
    return TextField(
      controller: addQuestionData.title,
      onChanged: (value) {
        addQuestionData.showButtonColor();
      },
      style: aBeeZee16w400.copyWith(
          fontSize: AppFontSize.font14, color: AppColors.whiteLight2Color),
      cursorColor: AppColors.blackColor,
      decoration: InputDecoration(
          hintText: AppString.questionTitle,
          hintStyle: aBeeZee16w400.copyWith(
              fontSize: AppFontSize.font14, color: AppColors.whiteLight2Color),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          isDense: true,
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.whiteLight3Color, width: 0.5)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.whiteLight3Color, width: 0.5))),
    );
  }

  ///question box

  Padding questionBox(double w, AddQuestionNotifier addQuestionData) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Container(
          height: 32.h,
          width: w,
          decoration:
              BoxDecoration(border: Border.all(color: AppColors.blackColor)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: new DropdownButton(
              value: addQuestionData.selectedQuestion,
              onChanged: (String? newValue) {
                addQuestionData.setQuestion(newValue!);
              },
              isExpanded: true,
              underline: SizedBox(),
              style: aDLaM16w400.copyWith(
                  fontSize: AppFontSize.font14, color: AppColors.blackColor),
              items: addQuestionData.questionList.map((String value) {
                return DropdownMenuItem<String>(
                  child: Text(value,
                      style: aDLaM16w400.copyWith(
                          fontSize: AppFontSize.font14,
                          color: AppColors.blackColor)),
                  value: value,
                );
              }).toList() /*Align(
            alignment: Alignment.centerLeft,
            child: "27. Algebra 12: Functions 4 Trignometry"
                .txt(style: aDLaM16w400.copyWith(fontSize: AppFontSize.font14)),
          )*/
              ,
            ),
          ),
        ));
  }

  Divider divider() {
    return Divider(
      height: 0,
      thickness: 0.5,
      color: AppColors.whiteLight3Color,
    );
  }

  ///new question text
  Padding newQuestionText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: AppString.cancel
                .toString()
                .txt(style: aDLaM16w400.copyWith(fontSize: AppFontSize.font10)),
          ),
          Spacer(),
          AppString.newQuestion
              .toString()
              .txt(style: aBeeZee16w400.copyWith(fontSize: AppFontSize.font14)),
          Spacer()
        ],
      ),
    );
  }
}
