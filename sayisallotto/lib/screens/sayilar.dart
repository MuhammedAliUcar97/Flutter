import 'dart:math';
import 'package:flutter/material.dart';

final myController = TextEditingController();

class Sayisal_loto extends StatefulWidget {
  const Sayisal_loto({super.key});

  @override
  State<Sayisal_loto> createState() => _Sayisal_lotoState();
}

class _Sayisal_lotoState extends State<Sayisal_loto> {
  int butce = 10;
  int dogrusayisi = 0;
  int kazanilanPara = 0;

  final textfield1 = TextEditingController();
  final textfield2 = TextEditingController();
  final textfield3 = TextEditingController();
  final textfield4 = TextEditingController();
  final textfield5 = TextEditingController();
  final textfield6 = TextEditingController();

  @override
  void OdulSistemi() {
    switch (dogrusayisi) {
      case 1:
        kazanilanPara = 10;
        butce += kazanilanPara;
        break;
      case 2:
        kazanilanPara = 15;
        butce += kazanilanPara;
        break;
      case 3:
        kazanilanPara = 20;
        butce += kazanilanPara;
        break;
      case 4:
        kazanilanPara = 30;
        butce += kazanilanPara;
        break;
      case 5:
        kazanilanPara = 40;
        butce += kazanilanPara;
        break;
      case 6:
        kazanilanPara = 100;
        butce += kazanilanPara;
        break;
      default:
    }
  }

  Widget build(BuildContext context) {
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sayisal Loto",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
        ),
        actions: [
          Text(
            "$butce" "tl bütçeniz var ",
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: textfield1,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      decoration: const InputDecoration(
                        counterText: "\n",
                        border: OutlineInputBorder(),
                        labelText: 'sayi giriniz',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: textfield2,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: "\n",
                        labelText: 'sayi giriniz',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: textfield3,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: "\n",
                        labelText: 'sayi giriniz',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: textfield4,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: "\n",
                        labelText: 'sayi giriniz',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: textfield5,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: "\n",
                        labelText: 'sayi giriniz',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: textfield6,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: "\n",
                        labelText: 'sayi giriniz',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        dogrusayisi = dogrusayisi * 0;

                        setState(
                          () {
                            final List<int> _case =
                                List.generate(6, (_) => Random().nextInt(60));

                            if (butce < 5) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Column(
                                      children: [
                                        Text("Yetersiz bakiye"),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else {
                              butce -= 5;
                            }
                            butce = kazanilanPara + butce;

                            _case[0].toString() == textfield1.text
                                ? dogrusayisi += 1
                                : null;
                            _case[1].toString() == textfield2.text
                                ? dogrusayisi += 1
                                : null;
                            _case[2].toString() == textfield3.text
                                ? dogrusayisi += 1
                                : null;
                            _case[3].toString() == textfield4.text
                                ? dogrusayisi += 1
                                : null;
                            _case[4].toString() == textfield5.text
                                ? dogrusayisi += 1
                                : null;
                            _case[5].toString() == textfield6.text
                                ? dogrusayisi += 1
                                : null;
                            OdulSistemi();

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("[${textfield1.text},"),
                                          Text(" ${textfield2.text},"),
                                          Text(" ${textfield3.text},"),
                                          Text(" ${textfield4.text},"),
                                          Text(" ${textfield5.text},"),
                                          Text(" ${textfield6.text}]"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("$_case"),
                                        ],
                                      ),
                                      Row(
                                        children: [Text(" $dogrusayisi")],
                                      ),
                                    ],
                                  ),
                                );
                            
                              },
                            );
                          },
                        );
                      },
                      child: const Text("oyna")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
