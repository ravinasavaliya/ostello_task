import 'package:flutter/material.dart';

import '../view/AddQuestion/add_question_screen.dart';
import '../view/Question/question_screen.dart';
import '../view/Reply/reply_screen.dart';

class Routes {
  ///routes names
  static String questionList = '/';
  static String addQuestionScreen = '/AddQuestionScreen';
  static String replyScreen = '/ReplyScreen';

  ///roues map
  static Map<String, WidgetBuilder> routes = {
    questionList: (context) => const QuestionScreen(),
    addQuestionScreen: (context) => const AddQuestionScreen(),
    replyScreen: (context) => const ReplyScreen(),
  };
}
