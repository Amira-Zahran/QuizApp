import 'package:flutter/material.dart';
import 'package:quiz_app_task2/Model/QuestionModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var image;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task',
      home: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('Fill the jar by answering the questions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Center(
                    child: SizedBox(
                        width: 50, height: 50,
                        child: Image(image: AssetImage('assets/game.png'))),
                  )
                ],),
              const Center(
                child: SizedBox(
                    width: 60, height: 60,
                    child: Image(image: AssetImage('assets/tetris.png'))),
              ),
              const Center(
                child: SizedBox(
                    width: 400,
                    height: 400,
                    child: QuestionWidget()),
              ),
              //glass(),
            ],
          )),
    );
  }

  Image buildImage(Option option){
    return Image(image: option.isCorrect ? const AssetImage('assets/one.png') : const AssetImage('assets/glass.png'));
  }

  Widget glass(Option option){
    return Center(child: Container(
      //color: Color.fromRGBO(255, 132, 80, 1),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 132, 80, 1),
          borderRadius: BorderRadius.circular(16),),
        width: 80, height: 60,
        child: Image(image: image, fit: BoxFit.cover,)));
  }
}



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
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Question $_questionNumber',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, ),),
          //const Divider(thickness: 1, color: Colors.grey,),
          Expanded(child: PageView.builder(
            itemCount: Questions.length,
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              final _question = Questions[index];
              return buildQuestion(_question);
            },
          ),),

          Center(child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 132, 80, 1),
                borderRadius: BorderRadius.circular(16),),
              width: 80, height: 70,
              child: Image.asset(_questionNumber == 1 ? 'assets/one.png' : 'assets/tw.png',))),

          Center(child: buildElevatedButton()),
          //const Image(image: AssetImage('assets/glass.png'),)
        ],),
    );
  }

  Column buildQuestion(Question question){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.text,style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, ),),
        const SizedBox(height: 32,),
        Expanded(child: OptionsWidget(
          question: question,
          onClickedOption: (option){
            if(question.isLocked){
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
        ))
      ],
    );
  }

  ElevatedButton buildElevatedButton(){
    return ElevatedButton(onPressed: (){
      if (_questionNumber < Questions.length){
        _controller.nextPage(duration: Duration(milliseconds: 250),
          curve: Curves.easeInExpo
        );
        setState((){
          _questionNumber++;
        });

      }
    }, child: Text(_questionNumber < Questions.length ? 'data' : 'done'));
  }




}

Widget getImageForOption(Option option, Question question) {
  final isSelected = option == question.selectedOption;
  if(question.isLocked){
    if(isSelected){
      return option.isCorrect ? Image.asset('assets/two.png') : Image.asset('assets/one.png');
    } else if (option.isCorrect){
      return Image.asset('assets/two.png');
    }
  }
  return Image.asset('assets/two.png');
}


class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  //final ValueChanged<Image> image;

  OptionsWidget({Key? key, required this.question, required this.onClickedOption}) : super(key: key);

  //int _questionNumber = 1;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: question.options.map((option) =>
          buildOption(context, option)).toList(),
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () {
        onClickedOption(option);
        //_questionNumber ++;
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







