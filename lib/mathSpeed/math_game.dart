//Sriya Nagesh (SUKD1902368) BIT-UCLAN
import 'package:cobloom/mathSpeed/math_screens.dart';

class MathGameAddScreen extends StatelessWidget {
  const MathGameAddScreen({Key? key}) : super(key: key);

//runs addition game
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: RunQuizAdd(),
        ),
      ),
    );
  }
}

class MathGameMultiplyScreen extends StatelessWidget {
  const MathGameMultiplyScreen({Key? key}) : super(key: key);

//runs multiplication game
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: RunQuizMultiply(),
        ),
      ),
    );
  }
}
