import 'dart:ui';

import 'package:flutter/material.dart';

void test() {
  int idade = 27;
  print("Idade: $idade");

  double salario = 30000;
  print("Meu salário é R\$ $salario");

  String text = "Batata doce é da hora";
  String char = 'Double quotes in "single" quotes';

  dynamic coisaLoca = 10;
  coisaLoca = 'demais!';

  print(char);

  if (idade > 100) {
    print("Idade é maior do que 100");
  } else if (idade >= 28) {
    print("Idade é maior do que 28");
  } else {
    print("Idade é menor do que 28");
  }

  List<String> testeLista = ['batata', 'batata', 'batata'];

  int contador = 0;
  while (contador < 2) {
    print("Contador: $contador");
    contador++;
  }

  for (int contador2 = 0; contador2 <= 10; contador2++) {
    //do stuff
  }

  // for (;;) {}

  int mes = 0;
  switch (mes) {
    case 1:
      print("");
      break;
    default:
      print("");
      break;
  }

  var promoActive = false;

  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];

  nav.forEach((element) => print(element));

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  for (var element in nobleGases.entries) {
    print(element);
  }

  enableFlags(bold: true, hidden: false);

  var makeAdder2 = makeAdder(2);
  var makeAdder10 = makeAdder(10);

  print('makeAdder2 = ${makeAdder2(3)}');
  print('makeAdder10 = ${makeAdder10(3)}');
}

Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

// var paint = Paint()
// ?..color...
var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0
  ..invertColors = true;

// ?? == Elvis Operator
String playerName(String? name) => name ?? 'Guest';

void enableFlags({bool bold = false, bool hidden = false}) {}

List<String> nobleGases = ['Teste', 'Teste2'];

isNoble(atomicNumber) {
  return nobleGases[atomicNumber] != null;
}

bool isNoble2(int atomicNumber) => nobleGases[atomicNumber] != null;
