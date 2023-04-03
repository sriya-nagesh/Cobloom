//Sriya Nagesh (SUKD1902368) BIT-UCLAN
import 'dart:async';
import 'package:cobloom/mathSpeed/math_screens.dart';
import 'package:flutter/services.dart';

//created a new instance of the math logic add class
MathLogicAdd malogic = MathLogicAdd();

class RunQuizAdd extends StatefulWidget {
  const RunQuizAdd({Key? key}) : super(key: key);

  @override
  RunQuizAddState createState() => RunQuizAddState();
}

class RunQuizAddState extends State<RunQuizAdd> {
  var heart = 5;
  var answer = 0;
  var gem = 0;
  var timer = 60;
  var showtimer = "60";
  bool stoptimer = false;
  var number = TextEditingController();
  //checks if answer is correct
  void confirm(var userAnswer) {
    var correctAnswer = int.parse(malogic.answer());

//timer function
    void startTimer() async {
      const onesec = Duration(seconds: 2);
      Timer.periodic(onesec, (Timer t) {
        setState(() {
          if (timer < 1) {
            t.cancel();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return EndScreenOOT(
                    //displays if user is out of time
                    gems: gem,
                    hearts: heart,
                  );
                },
              ),
            );
          } else if (stoptimer == true) {
            t.cancel();
          } else {
            timer = timer - 1;
          }
          showtimer = timer.toString();
        });
      });
    }

//rewards system
    setState(() {
      startTimer();
      if (heart - 1 == 0) {
        gem = 0;
        stoptimer = true;
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EndScreenOOH();
        }));
      } else {
        if (correctAnswer == userAnswer) {
          gem += 1;
          number.clear();
        } else {
          heart -= 1;
          number.clear();
        }
        malogic.next();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/screens/mathGamebg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //top bar to display hearts, gems and timer
              Expanded(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                      width: 40,
                    ),
                    ElevatedButton.icon(
                      label: Text(heart.toString()),
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red[300],
                        size: 35,
                      ),
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.blueGrey[800],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton.icon(
                      label: Text(gem.toString()),
                      icon: Icon(
                        Icons.star_rounded,
                        color: Colors.blue[50],
                        size: 35,
                      ),
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.blueGrey[800],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton.icon(
                      label: Text(showtimer),
                      icon: Icon(
                        Icons.timer,
                        color: Colors.blueGrey[800],
                        size: 35,
                      ),
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.red,
                          primary: Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Center(
                    child: Text(
                      malogic.question(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 70,
                          fontFamily: 'Chewy',
                          color: Colors.blueGrey[800]),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 120),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[800],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  controller: number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.all(20),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.yellow[50],
                      fontFamily: 'Chewy',
                      fontSize: 50),
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (var value) {
                    setState(
                      () {
                        answer = int.parse(value);
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: IconButton(
                          iconSize: 100,
                          color: Colors.blue[200],
                          icon: Icon(Icons.forward),
                          onPressed: () {
                            confirm(answer);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
