//Sriya Nagesh (SUKD1902368) BIT-UCLAN
// ignore_for_file: non_constant_identifier_names

import 'package:cobloom/DatabaseHandler/cobloom_database.dart';
import 'package:cobloom/colorMatch/run_color_match.dart';
import 'package:cobloom/screens/buy_hearts.dart';
import 'package:cobloom/widgets/background.dart';
import 'package:cobloom/MathSpeed/Math_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  late DbHelper dbHelper;
  final Username = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();

    dbHelper = DbHelper();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

//display username
    setState(() {
      Username.text = sp.getString("username")!;
    });
  }

//UI after login - user chooses what they want to do
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Background(
            image: 'assets/images/screens/Dashboard.png',
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      //view profile
                      IconButton(
                        iconSize: 50,
                        icon: Icon(Icons.account_circle),
                        color: Colors.blueGrey[800],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                      ),
                      //view buy hearts page
                      ElevatedButton.icon(
                        label: Text(''),
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red[300],
                          size: 40,
                        ),
                        style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            primary: Colors.blueGrey[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BuyHearts()),
                          );
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton.icon(
                        label: Text(''),
                        icon: Icon(
                          Icons.star_rounded,
                          color: Colors.blue[50],
                          size: 40,
                        ),
                        style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            primary: Colors.blueGrey[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Text(
                    "Welcome " + Username.text + "!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.yellow[50],
                      fontFamily: 'Chewy',
                      fontSize: 35,
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
                            //run color match
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(350, 230),
                                  primary: Colors.grey[100],
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ColorMatch()),
                                );
                              },
                              child: Text(
                                'Color Match',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey[850],
                                    fontSize: 76,
                                    fontFamily: 'Chewy'),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            //redirect to choose math game page
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(350, 230),
                                  primary: Colors.grey[100],
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChooseMathGame()),
                                );
                              },
                              child: Text(
                                'Math Speed',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey[850],
                                    fontSize: 76,
                                    fontFamily: 'Chewy'),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            )
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
