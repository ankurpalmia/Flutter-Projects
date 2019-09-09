import 'package:flutter/material.dart';
import 'package:quizzler/quizMaster.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizMaster quizMaster=QuizMaster();                         //creating instance

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),                              //calling the component
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> icons=[];      //icons list
  int score=0;       //scoreCard
  void checkAnswer(bool myAnswer){        //called from True and False
    setState(() {
      if(quizMaster.qnumber==quizMaster.questionBank.length-1){   //checking end question
        if (myAnswer == quizMaster.correctAnswer()) {
          icons.add(Icon(Icons.check, color: Colors.green,),);  //add green check icon
          score++;                                              //increase score
        }
        Alert(       //creating Alert at the end
          context: context,
          title: 'Finished!',
          desc: 'Score: $score correct out of 13',
        ).show();
        quizMaster.reset();      //resets question Number
        icons=[];       //reset icon list
        score=0;      //reset score
      }
      else {       //if questions are left
          if (myAnswer == quizMaster.correctAnswer()) {
            icons.add(Icon(Icons.check, color: Colors.green,),);  //add green check icon
            score++;                                              //increase score
          }
          else {
            icons.add(Icon(Icons.close, color: Colors.red,),);    //add red cross icon
          }
          quizMaster.nextQuestion();      //increase question number
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int ques=quizMaster.qnumber+1;      //for question number at top
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(         //question number
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
            child: Text(
              'Question $ques',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),

            ),
          )
        ),
        Expanded(           //question
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizMaster.getQuestion() ,      //getQuestion in method in quizMaster
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(           //True button
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true
                  checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(           //False button
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(                //Icon Row
          children: icons,
        ),
      ],
    );
  }
}
