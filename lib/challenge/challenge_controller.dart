import 'package:flutter/cupertino.dart';

class ChalengeController{
  final currentPageNotifier = ValueNotifier<int>(1);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  int qtdAnswerRight = 0;
}
