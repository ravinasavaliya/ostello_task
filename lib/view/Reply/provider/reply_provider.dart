import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final replyScreenProvider = ChangeNotifierProvider.autoDispose<ReplyNotifier>(
    (ref) => ReplyNotifier(ref));

class ReplyNotifier extends ChangeNotifier {
  Ref ref;
  ReplyNotifier(this.ref);

  List<Map<String, dynamic>> replyList = [
    {
      "title":
          "Hi Shahbaz, let me answer your question first you have to find the cosec and then work on it below.I hope this clears your doubt.",
      "name": "VR Academy",
      "date": "  23 May 2020",
    },
    {
      "title":
          "I also had the samilar query and i don’t think so i understand this part properly.",
      "name": "Anshdeep Singh",
      "date": "  22 May 2020",
    },
  ];
}
