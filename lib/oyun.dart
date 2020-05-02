import 'dart:async';
import 'package:biliyommu/manyQuestions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ManyQuestions manyQuestions = ManyQuestions();

class Oyun extends StatefulWidget {
  @override
  _OyunState createState() => _OyunState();
}

class Score{
  int score;
  Score(this.score);
}

class _OyunState extends State<Oyun> {

  int step = 0;
  int _hak = 3;
  int section = -1;

  String soru = "";
  String aSikki = "", bSikki="", cSikki="", dSikki="";
  String dogru="";
  String kontrol="";
  int _score = 0;

  void resetGame(){
    setState(() {
      section = 0;
    });
  }

  Timer _timer;
  int _start = 100;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void changeQuestion() {
    if(step == 20){
      section = 1;
    }else {
      step++;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    if(_hak == 0){

      setState(() {
        section = 1;
      });
    }
    if(_start == 0){
      setState(() {
        section = 1;
      });
    }

var shownWidget;

if(section == -1){
  shownWidget = <Widget>[
    SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      SizedBox(height: 250,),
      FlatButton(
    onPressed: (){
      startTimer();
      section = 0;
    },
        child: Text('Start',style: TextStyle(fontSize: 30, color: Colors.white),),
    ),
      SizedBox(height: 250,),
      Text('Created by Malozyali', style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: 'DancingScript'),),
    ],
    ),
      ),
  ];
}
else
if(section == 0){

  shownWidget = <Widget> [

    Column(
    children: <Widget>[
      SizedBox(height: 50,),
      Text("Score:  $_score     Timer: $_start    Chance: $_hak",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,color: Colors.white),),
      //Sorulacak soru

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.pink,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
            color: Colors.red[100],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
          ),
          height: 120,
          width: 500,
          child: Center(child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              manyQuestions.questionBank[step].question,
              style: TextStyle(fontSize: 20),
            ),
          )),
        ),
      ),
      SizedBox(height: 20,),
      //A şıkkı
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(

          onTap: (){
            setState(() {
              kontrol = manyQuestions.questionBank[step].aSikki;
              if(manyQuestions.questionBank[step].answer == kontrol){
                changeQuestion();
                _score = _score + 10;
                _start = _start+5;
              }else{
                _hak--;
                changeQuestion();
              }
            });
          },
          child: Container(

            height: 50,
            width: 500,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],
              color: Colors.blue[100],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Text(manyQuestions.questionBank[step].aSikki,
    style: TextStyle(fontSize: 20),
            )),

          ),
        ),
      ),
      //B şıkkı
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: (){
            setState(() {
              kontrol = manyQuestions.questionBank[step].bSikki;
              if(manyQuestions.questionBank[step].answer == kontrol){
                changeQuestion();
                _score = _score + 10;
                _start = _start+5;
              }
              else{
                _hak--;
                changeQuestion();
              }
            });
          },
          child: Container(
            height: 50,
            width: 500,

            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],


              color: Colors.blue[100],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Text(manyQuestions.questionBank[step].bSikki,style: TextStyle(fontSize: 20),)),
          ),
        ),
      ),
      //C şıkkı
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: (){
            setState(() {
              kontrol = manyQuestions.questionBank[step].cSikki;
              if(manyQuestions.questionBank[step].answer == kontrol){
                changeQuestion();
                _score = _score + 10;
                _start = _start+5;
              }else{
                _hak--;
                changeQuestion();
              }
            });
          },
          child: Container(
            height: 50,
            width: 500,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],
              color: Colors.blue[100],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Text(manyQuestions.questionBank[step].cSikki,style: TextStyle(fontSize: 20),)),
          ),
        ),
      ),
      //D şıkkı
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: (){
            setState(() {
              kontrol = manyQuestions.questionBank[step].dSikki;
              if(manyQuestions.questionBank[step].answer == kontrol){
                changeQuestion();
                _score = _score + 10;
                _start = _start+5;
              }else{
                _hak--;
                changeQuestion();
              }
            });
          },
          child: Container(
            height: 50,
            width: 500,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],
              color: Colors.blue[100],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Text(manyQuestions.questionBank[step].dSikki,style: TextStyle(fontSize: 20),)),
          ),
        ),
      ),
    ],
  ),
];



}else
if(section == 1){
    shownWidget = <Widget> [
      Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 200,),
          Container(
            child: Center(child: Text("Game Over",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.blue,fontSize: 60),)),
          ),
          SizedBox(height: 10,),
          Container(
            child: Center(child: Text("Score: $_score",style: TextStyle(fontSize: 50),)),
          ),
          FlatButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Oyun()),
              );
            },
            child: Text("Try Again",style: TextStyle(fontSize: 20,color: Colors.white,),),
          ),
        ],
      ),
    ),
          ];
}
return Scaffold(
  body: Container(color: Colors.teal[200],
    child: Center(
      child: Column(
        children: shownWidget,
      ),
    ),
  ),
);
  }
}
