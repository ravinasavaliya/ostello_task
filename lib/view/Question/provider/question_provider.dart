import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/constants/app_asset.dart';
import 'package:task/constants/app_string.dart';

final questionScreenProvider =
    ChangeNotifierProvider.autoDispose<QuestionNotifier>(
        (ref) => QuestionNotifier(ref));

class QuestionNotifier extends ChangeNotifier {
  Ref ref;
  QuestionNotifier(this.ref);

  List<Map<String, dynamic>> list = [
    {
      "image": AppAssets.chat,
      "title": AppString.chats,
    },
    {
      "image": AppAssets.question,
      "title": AppString.doubts,
    },
    {
      "image": AppAssets.book,
      "title": AppString.notes,
    },
    {
      "image": AppAssets.rewards,
      "title": AppString.rewards,
    },
  ];

  int selectedIndex = 1;
  setIndex(int val) {
    selectedIndex = val;
    notifyListeners();
  }

  List<Map<String, dynamic>> questionList = [
    {
      "name": "How can the user click on different ads?",
      "answer":
          "I don’t understand one thing in this topic that how can a user click on this navigation bar and go on to next fieldBla avla and yupiiees please explain me the answer of my trignometary.Thanks, Shahbaz"
    },
    {
      "name": "How can the user click on different ads?",
      "answer":
          "I don’t understand one thing in this topic that how can a user click on this navigation bar and go on to next fieldBla avla and yupiiees please explain me the answer of my trignometary.Thanks, Shahbaz"
    },
  ];
  addQuestion(String title, detail) {
    questionList.add({"name": title, "answer": detail});
    notifyListeners();
  }
}
