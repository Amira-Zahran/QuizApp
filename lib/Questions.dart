
import 'package:flutter/material.dart';

import 'Model/QuestionModel.dart';
import 'Options.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late PageController _controller;
  int _questionNumber = 1;


  @override
  void initState(){
    super.initState();
    _controller = PageController(initialPage: 0,);
  }


  @override
  Widget build(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Question $_questionNumber',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, ),),
          Expanded(child: PageView.builder(
            itemCount: Questions.length,
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              final question = Questions[index];
              return buildQuestion(question);
            },
          ),),
          const SizedBox(height: 20,),
          Center(child: buildElevatedButton()),
        ],),
    );
  }

  Column buildQuestion(Question question){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            width: 60, height: 60,
            child: question.image,),
        ),
        Text(question.text,style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, ),),
        const SizedBox(height: 32,),
        Expanded(child: OptionsWidget(
          question: question,
          onClickedOption: (option){
            if(question.isLocked){
              //NeverScrollableScrollPhysics;
              //Image.asset('assets/two.png');
              //_questionNumber++;
              return;
            } else{
              setState(() {
                //_questionNumber++;
                question.isLocked = true;
                question.selectedOption = option;
              });
            }
          },
        )),
        const SizedBox(height: 20,),
        Center(
          child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 132, 80, 1),
                borderRadius: BorderRadius.circular(16),),
              width: 80, height: 60,
            // ignore: unnecessary_null_comparison
            child: question.selectedOption!.isCorrect
                  ? question.exit
                  : question.jar,
            )
          ),
      ],
    );
  }

  Widget buildElevatedButton(){

    return _questionNumber < Questions.length
        ? ElevatedButton(
        onPressed: () {
          //final isSelected = Option == question.;
            if (_questionNumber < Questions.length) {
              _controller.nextPage(duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInExpo
              );
              setState(() {
                _questionNumber++;
              });
            }
          }, child: const Text('Next', style: TextStyle(color: Colors.white),))
        : const Text('') ;
  }

}
