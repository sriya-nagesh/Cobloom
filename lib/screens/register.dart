//Sriya Nagesh (SUKD1902368) BIT-UCLAN
// ignore_for_file: non_constant_identifier_names

import 'package:cobloom/screens/screens.dart';
import 'package:cobloom/widgets/background.dart';
import 'package:cobloom/widgets/dialog.dart';
import 'package:cobloom/DatabaseHandler/cobloom_database.dart';
import 'package:cobloom/Model/new_user_record.dart';

//page to register user into database so that they can login into the system
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final Username = TextEditingController();
  final Email = TextEditingController();
  final Password = TextEditingController();
  dynamic dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  validateEmail(String email) {
    final emailReg = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return emailReg.hasMatch(email);
  }

  signUp() async {
    String uname = Username.text;
    String email = Email.text;
    String password = Password.text;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

//if user is saved into database
      NewUserRecord userRecord = NewUserRecord(uname, email, password);
      await dbHelper.saveData(userRecord).then((userData) {
        alertDialog(context, "Successfully Saved");

//if user is not due to error or due to the email already exisitng in the database
        Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
      }).catchError(
        (error) {
          debugPrint(error);
          alertDialog(context, "Register Failed");
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Background(
            image: 'assets/images/screens/Registration.png',
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 90),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 240,
                        ),
                        //text field for email
                        TextFormField(
                          controller: Email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            if (!validateEmail(value)) {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            hintText: 'Email',
                            labelText: 'Email',
                            fillColor: Colors.blue[50],
                            filled: true,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        //text field for username
                        TextFormField(
                          controller: Username,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            hintText: 'Username',
                            labelText: 'Username',
                            fillColor: Colors.blue[50],
                            filled: true,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        //text field for password
                        TextFormField(
                          controller: Password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            hintText: 'Password',
                            fillColor: Colors.blue[50],
                            filled: true,
                          ),
                        ),
                        //register the user
                        Container(
                          margin: EdgeInsets.all(30.0),
                          width: double.infinity,
                          child: TextButton(
                            child: Text(
                              'Signup',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: signUp,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[800],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //go to login page
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Text(
                                'Login Here!',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blueGrey[800]),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
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
          ),
        ],
      ),
    );
  }
}
