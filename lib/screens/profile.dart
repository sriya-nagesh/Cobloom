//Sriya Nagesh (SUKD1902368) BIT-UCLAN
// ignore_for_file: non_constant_identifier_names

import 'package:cobloom/screens/screens.dart';
import 'package:cobloom/widgets/dialog.dart';
import 'package:cobloom/DatabaseHandler/cobloom_database.dart';
import 'package:cobloom/Model/new_user_record.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

//user can update their password and username in this page
class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  late DbHelper dbHelper;
  final Email = TextEditingController();
  final Username = TextEditingController();
  final Password = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();

    dbHelper = DbHelper();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

    setState(() {
      Email.text = sp.getString("email")!;
      Username.text = sp.getString("username")!;
      Password.text = sp.getString("password")!;
    });
  }

//update into database function
  update() async {
    String email = Email.text.trim();
    String username = Username.text.trim();
    String passwd = Password.text.trim();

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      NewUserRecord user = NewUserRecord(username, email, passwd);
      await dbHelper.updateUser(user).then((value) {
        if (value == 1) {
          alertDialog(context, "Successfully Updated");

          updateSP(user, true).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => Login()),
                (Route<dynamic> route) => false);
          });
        } else {
          alertDialog(context, "Error Update");
        }
      }).catchError((error) {
        debugPrint(error);
        alertDialog(context, "Error");
      });
    }
  }

  Future updateSP(NewUserRecord user, bool add) async {
    final SharedPreferences sp = await _pref;

    if (add) {
      sp.setString("username", user.username);
      sp.setString("password", user.password);
    } else {
      sp.remove('username');
      sp.remove('password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[100],
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
              margin: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Edit your Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Chewy',
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //email non editable
                    TextField(
                      controller: Email,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        hintText: "Email",
                        hintStyle: textbox,
                        labelText: 'Email',
                        fillColor: Colors.yellow[100],
                        filled: true,
                      ),
                      style: textbox,
                    ),
                    SizedBox(height: 15),
                    //update username
                    TextField(
                      controller: Username,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        hintText: "Username",
                        hintStyle: textbox,
                        labelText: 'Username',
                        fillColor: Colors.yellow[100],
                        filled: true,
                      ),
                      style: textbox,
                    ),
                    SizedBox(height: 15),
                    //update password
                    TextField(
                      controller: Password,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        hintText: "Password",
                        hintStyle: textbox,
                        labelText: 'Password',
                        fillColor: Colors.yellow[100],
                        filled: true,
                      ),
                      style: textbox,
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(50, 60),
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        child: Text('Update',
                            style: TextStyle(
                                color: Colors.blueGrey[800],
                                fontSize: 20,
                                fontFamily: 'Chewy')),
                        //updates username or password
                        onPressed: update,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(50, 60),
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        //logs user out of their account
                        child: Text('Logout',
                            style: TextStyle(
                                color: Colors.blueGrey[800],
                                fontSize: 20,
                                fontFamily: 'Chewy')),
                        onPressed: () {
                          alertDialog(context, "You have logged out");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
