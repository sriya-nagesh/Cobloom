//Sriya Nagesh (SUKD1902368) BIT-UCLAN
import 'package:cobloom/screens/dashboard.dart';
import 'package:flutter/material.dart';

//displays when user is out of hearts
class EndScreenOOH extends StatelessWidget {
  const EndScreenOOH({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/screens/Endscreen.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.white10,
            body: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    size: 180,
                    color: Colors.yellow[50],
                  ),
                  label: Text(""),
                  style: TextButton.styleFrom(
                    primary: Colors.transparent,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                    child: Center(
                      child: Text(
                        'Out Of Hearts!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 80,
                            fontFamily: 'Chewy',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 55),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        primary: Colors.yellow[50],
                      ),
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: 50,
                        color: Colors.blueGrey[800],
                      ),
                      label: Text(
                        'Dashboard',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Chewy',
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[800]),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Dashboard();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//displays when user is out of time
class EndScreenOOT extends StatelessWidget {
  //constructor takes in gems and hearts to view at the end of this end screen
  const EndScreenOOT({
    Key? key,
    required this.hearts,
    required this.gems,
  }) : super(key: key);

  final int hearts;
  final int gems;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/screens/Endscreen.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.white10,
            body: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.timer,
                    size: 180,
                    color: Colors.teal[50],
                  ),
                  label: Text(""),
                  style: TextButton.styleFrom(
                    primary: Colors.transparent,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                    child: Center(
                      child: Text(
                        'Out Of Time!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'Chewy',
                            color: Colors.red[200]),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2,
                    ),
                    child: Center(
                      child: Text(
                        'Gems Earned: ' + gems.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Chewy',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                    child: Center(
                      child: Text(
                        'Hearts left this game: ' + hearts.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Chewy',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 55),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        primary: Colors.teal[50],
                      ),
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: 50,
                        color: Colors.blueGrey[800],
                      ),
                      label: Text(
                        'Dashboard',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Chewy',
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[800]),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Dashboard();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
