import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/model/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {

final QuestionModel question;
final ValueChanged<bool> onSelected;
  
  QuizWidget ({
    Key? key, 
    required this.question, 
    required this.onSelected
    ,
    }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64,),
          Text( widget.question.title, style: AppTextStyles.heading,),
          SizedBox(height: 24),
          for(var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: answer(i),
              isSelected: indexSelected == i,
              disabled: indexSelected != -1,
              onTap: (value) {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1)).then((_) => widget.onSelected(value));
              },
              )
          /*
          ...widget.question.answers.map(
            (e) => AnswerWidget(
              isRight: e.isRight,
              title: e.title,
            )
            ).toList()
          */
        ],
      ),
    );
  }
}