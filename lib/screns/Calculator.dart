import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;

  Widget calcbutton(
      String btntxt, Color btncolor, Color txtcolor, double Fntsize) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: Fntsize,
            color: txtcolor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: calcbutton('/', Colors.amber[700]!,
                                      Colors.white, 35),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: calcbutton(
                                      'AC', Colors.grey, Colors.black, 35),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: calcbutton(
                                      '+/-', Colors.grey, Colors.black, 35),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: calcbutton(
                                      '%', Colors.grey, Colors.black, 35),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              '7', Colors.grey[850]!, Colors.white, 35),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              '8', Colors.grey[850]!, Colors.white, 35),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              '9', Colors.grey[850]!, Colors.white, 35),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              'x', Colors.amber[700]!, Colors.white, 35),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              '4', Colors.grey[850]!, Colors.white, 35),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              '5', Colors.grey[850]!, Colors.white, 35),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              '6', Colors.grey[850]!, Colors.white, 35),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              '-', Colors.amber[700]!, Colors.white, 35),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              '1', Colors.grey[850]!, Colors.white, 35),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              '2', Colors.grey[850]!, Colors.white, 35),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              '3', Colors.grey[850]!, Colors.white, 35),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              '+', Colors.amber[700]!, Colors.white, 35),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              calculation('0');
                            },
                            child: const Text(
                              '0',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                              
                            ),
                          ),
                        ),
                              Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              calculation('00');
                            },
                            
                            child: const Text(
                              '00',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                              
                            ),
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              '.', Colors.grey[850]!, Colors.white, 35),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: calcbutton(
                              '=', Colors.amber[700]!, Colors.white, 35),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = '$result.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-$result';
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
}
