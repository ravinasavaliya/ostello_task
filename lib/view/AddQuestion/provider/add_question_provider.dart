import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addQuestionScreenProvider =
    ChangeNotifierProvider.autoDispose<AddQuestionNotifier>(
        (ref) => AddQuestionNotifier(ref));

class AddQuestionNotifier extends ChangeNotifier {
  Ref ref;
  AddQuestionNotifier(this.ref);
  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();
  bool isShow = false;
  showButtonColor() {
    if (title.text.isEmpty || details.text.isEmpty) {
      isShow = false;
    } else {
      isShow = true;
    }
    notifyListeners();
  }

  String selectedQuestion = '27. Algebra 12: Functions 4 Trignometry';
  List<String> questionList = [
    '27. Algebra 12: Functions 4 Trignometry',
    '28. Algebra 13: Functions 4 Trignometry',
    '29. Algebra 14: Functions 4 Trignometry',
  ];

  setQuestion(String val) {
    selectedQuestion = val;
    notifyListeners();
  }
}
