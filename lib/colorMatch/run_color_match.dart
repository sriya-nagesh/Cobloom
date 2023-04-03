//Sriya Nagesh (SUKD1902368) BIT-UCLAN
import 'dart:async';
import 'package:cobloom/mathSpeed/math_screens.dart';
import 'package:cobloom/colorMatch/new_match.dart';

//runs color match game
class ColorMatch extends StatefulWidget {
  const ColorMatch({Key? key}) : super(key: key);

  @override
  _ColorMatchState createState() => _ColorMatchState();
}

class _ColorMatchState extends State<ColorMatch> {
  late List<NewMatch> items;
  late List<NewMatch> items2;
  int heart = 5;
  int gem = 0;
  var timer = 60;
  var showtimer = "60";
  bool stoptimer = false;
  bool gameOver = true;

//timer function (60 seconds with 1 second:2 seconds)
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
                //end screen when time runs out
                return EndScreenOOT(
                  gems: gem,
                  hearts: heart,
                );
              },
            ),
          );
        } else if (items.isEmpty) {
          reStartMatch();
        } else if (stoptimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  startMatch() {
    //start match
    startTimer(); //start timer
    gem = 0;
    reStartMatch();
  }

  //game continuity
  reStartMatch() {
    gameOver = false;
    items = [
      NewMatch(
          name: 'green',
          color: '🍏',
          match: 'assets/images/colorMatch/green.png'),
      NewMatch(
          name: 'blue',
          color: '❄️',
          match: 'assets/images/colorMatch/blue.png'),
      NewMatch(
          name: 'red', color: '🐞', match: 'assets/images/colorMatch/red.png'),
      NewMatch(
          name: 'pink',
          color: '🦑',
          match: 'assets/images/colorMatch/pink.png'),
      NewMatch(
          name: 'brown',
          color: '🥜',
          match: 'assets/images/colorMatch/brown.png'),
      NewMatch(
          name: 'orange',
          color: '🥕',
          match: 'assets/images/colorMatch/orange.png'),
      NewMatch(
          name: 'yellow',
          color: '☀️',
          match: 'assets/images/colorMatch/yellow.png'),
      NewMatch(
          name: 'gray',
          color: '🦏',
          match: 'assets/images/colorMatch/gray.png'),
      NewMatch(
          name: 'white',
          color: '🕊️',
          match: 'assets/images/colorMatch/white.png'),
    ];
    items2 = List<NewMatch>.from(items);

    //to provide a different combination every round
    items.shuffle();
    items2.shuffle();
  }

  @override
  void initState() {
    super.initState();
    startMatch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/screens/colorMatchbg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 26),
                child: Row(
                  children: <Widget>[
                    SizedBox(
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
              Center(
                child: Text(
                  "Drag the bucket to it's color!",
                  style: TextStyle(fontSize: 20, color: Colors.teal[600]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              if (gameOver == false) //UI for draggable and dragged items
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 26),
                    ),
                    Column(
                      children: items.map((item) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          child: Draggable<NewMatch>(
                            data: item,
                            childWhenDragging: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(
                                  'assets/images/colorMatch/empty.png'),
                            ),
                            feedback: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(item.match),
                              radius: 30,
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(item.match),
                              radius: 25,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Column(
                      children: items2.map(
                        (item) {
                          return DragTarget<NewMatch>(
                            //rewards system
                            onAccept: (receivedItem) {
                              if (item.name == receivedItem.name) {
                                setState(
                                  () {
                                    items.remove(receivedItem);
                                    items2.remove(item);
                                  },
                                );
                                gem += 1;
                                item.accepting = false;
                              } else {
                                setState(
                                  () {
                                    if (heart > 1) {
                                      heart -= 1;
                                      item.accepting = false;
                                    } else {
                                      gem = 0;
                                      stoptimer = true;
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return EndScreenOOH(); //end screen when hearts run out
                                      }));
                                    }
                                  },
                                );
                              }
                            },
                            onWillAccept: (receivedItem) {
                              setState(() {
                                item.accepting = true;
                              });
                              return true;
                            },
                            onLeave: (receivedItem) {
                              setState(() {
                                item.accepting = false;
                              });
                            },
                            builder: (context, acceptedItems, rejectedItems) =>
                                Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: item.accepting
                                    ? Colors.white70
                                    : Colors.blueGrey[700],
                              ),
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.width / 7,
                              width: MediaQuery.of(context).size.width / 4,
                              margin: EdgeInsets.all(4),
                              child: Text(
                                item.color,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
