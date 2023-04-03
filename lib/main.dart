//Sriya Nagesh (SUKD1902368) BIT-UCLAN
import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() {
  runApp(Cobloom());
}

class Cobloom extends StatelessWidget {
  const Cobloom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoBloom',
      theme: ThemeData(
        fontFamily: 'Chewy',
        primarySwatch: Colors.blueGrey,
      ),
      home: Login(),
    );
  }
}
