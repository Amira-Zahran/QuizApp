import 'package:flutter/material.dart';

import 'Model/QuestionModel.dart';

class OptionsWidget extends StatefulWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  //final ValueChanged<Image> image;

  OptionsWidget({Key? key, required this.question, required this.onClickedOption}) : super(key: key);

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  //int _questionNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.question.options.map((option) =>
          buildOption(context, option)).toList(),
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, widget.question);
    return GestureDetector(
      onTap: () {
        widget.onClickedOption(option);
        //_questionNumber ++;
        setState((){

        });
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          //border: Border.all(color: color),
        ),
        child: Center(child: Text(option.text, style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold),)),
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;

    if (question.isLocked) {
      if (isSelected) {
        if (option.isCorrect){
          return Colors.green ;
        }
        else {
          return Colors.red;
        }
        //Colors.deepPurple;
      }
    }
    return Colors.deepPurple;
    /*if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
        //Colors.deepPurple;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.deepPurple;*/
  }

  Widget getIconForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect
            ? const Icon(Icons.check_circle, color: Colors.green,)
            : const Icon(Icons.cancel, color: Colors.red,);
      } else if (option.isCorrect) {
        return const Icon(Icons.check_circle, color: Colors.green,);
      }
    }
    return const SizedBox.shrink();
  }
}

