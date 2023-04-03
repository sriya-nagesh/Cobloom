//Sriya Nagesh (SUKD1902368) BIT-UCLAN
import 'package:cobloom/mathSpeed/math_screens.dart';
import 'package:cobloom/widgets/background.dart';

class ChooseMathGame extends StatefulWidget {
  const ChooseMathGame({Key? key}) : super(key: key);

  @override
  State<ChooseMathGame> createState() => ChooseMathGameState();
}

//UI to choose addition or multiplication game
class ChooseMathGameState extends State<ChooseMathGame> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Background(
            image: 'assets/images/screens/MathGame.png',
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      IconButton(
                        iconSize: 50,
                        icon: Icon(Icons.arrow_back),
                        color: Colors.blueGrey[800],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()),
                          );
                        },
                      ),
                    ],
                  ),
                  Text(
                    "Pick a Game type!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Chewy',
                      fontSize: 38,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            //addition game
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(350, 220),
                                  primary: Colors.yellow[50],
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MathGameAddScreen()),
                                );
                              },
                              child: Text(
                                'Addition',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blueGrey[600],
                                    fontSize: 45,
                                    fontFamily: 'Chewy'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              //multiplication game
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(350, 220),
                                  primary: Colors.yellow[50],
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MathGameMultiplyScreen()),
                                );
                              },
                              child: Text(
                                'Multiplication',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blueGrey[600],
                                    fontSize: 45,
                                    fontFamily: 'Chewy'),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
