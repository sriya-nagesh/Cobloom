//Sriya Nagesh (SUKD1902368) BIT-UCLAN
import 'package:cobloom/screens/screens.dart';

//buy Hearts UI (functionality not implemented yet)
class BuyHearts extends StatelessWidget {
  const BuyHearts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/screens/Profile.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.white10,
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[800],
            elevation: 1,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
          ),
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Buy hearts!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 80, fontFamily: 'Chewy', color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: IconButton(
                  icon: Icon(Icons.monetization_on),
                  iconSize: 230,
                  color: Colors.white54,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                '1 heart : 5 Gems',
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Chewy', color: Colors.black),
              )),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
