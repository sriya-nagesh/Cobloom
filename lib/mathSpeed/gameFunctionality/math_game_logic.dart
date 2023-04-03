//Sriya Nagesh (SUKD1902368) BIT-UCLAN
import 'dart:math';

//logic for multiplication game
class MathLogicMultiply {
  List<int> numList = [];

  void next() {
    numList.removeRange(0, 3);
  }

//any number from 0 to 12
  String question() {
    for (int i = 1; i <= 4; i++) {
      var numItem = Random().nextInt(12);
      numList.add(numItem);
    }
    return numList[0].toString() + 'x' + numList[1].toString() + '=';
  }

  String answer() {
    var answ = numList[0] * numList[1];
    return answ.toString();
  }
}

//logic for addition game
class MathLogicAdd {
  List<int> numList = [];

  void next() {
    numList.removeRange(0, 3);
  }

//any number from 0 to 50
  String question() {
    for (int i = 1; i <= 4; i++) {
      var numItem = Random().nextInt(50);
      numList.add(numItem);
    }
    return numList[0].toString() + '+' + numList[1].toString() + '=';
  }

  String answer() {
    var answ = numList[0] + numList[1];
    return answ.toString();
  }
}
