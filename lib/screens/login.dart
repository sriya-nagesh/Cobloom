//Sriya Nagesh (SUKD1902368) BIT-UCLAN
// ignore_for_file: non_constant_identifier_names

import 'package:cobloom/mathSpeed/math_screens.dart';
import 'package:cobloom/widgets/dialog.dart';
import 'package:cobloom/DatabaseHandler/cobloom_database.dart';
import 'package:cobloom/Model/new_user_record.dart';
import 'package:cobloom/widgets/background.dart';
import 'package:shared_preferences/shared_preferences.dart';

//login page
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  final Email = TextEditingController();
  final Password = TextEditingController();
  dynamic dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

//login function
  login() async {
    String email = Email.text.trim();
    String password = Password.text.trim();

//ensures fields are not empty
    if (email.isEmpty) {
      alertDialog(context, "Please enter your email");
    } else if (password.isEmpty) {
      alertDialog(context, "Please enter your password");
    } else {
      await dbHelper.getLoginUser(email, password).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => Dashboard()),
                (Route<dynamic> route) => false);
          });
          //wrong password or email
        } else {
          alertDialog(context, "User Not Found");
        }
      }).catchError((error) {
        debugPrint(error);
        alertDialog(context, "Login Failed");
      });
    }
  }

  Future setSP(NewUserRecord user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("username", user.username);
    sp.setString("email", user.email);
    sp.setString("password", user.password);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Background(
            image: 'assets/images/screens/Login.png',
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 275,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow[100],
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: TextField(
                          //enter registered email
                          controller: Email,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            border: InputBorder.none,
                            hintText: 'email',
                            hintStyle: textbox,
                          ),
                          style: textbox,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow[100],
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: TextField(
                          //enter registered password
                          controller: Password,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            border: InputBorder.none,
                            hintText: 'password',
                            hintStyle: textbox,
                          ),
                          obscureText: true,
                          style: textbox,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        //log into to account
                        margin: EdgeInsets.all(30.0),
                        width: double.infinity,
                        child: TextButton(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.blueGrey[800], fontSize: 20),
                          ),
                          onPressed: login,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //redirect to register page
                          TextButton(
                            child: Text(
                              'Register Here!',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.yellow[100]),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
