import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reto1-Equipo9',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Conversor de monedas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class calculadora {
  final titulo;
  final color;
  final icono;

  calculadora(this.titulo, this.color, this.icono);
}

final textOrigen = TextEditingController();
final textDestino = TextEditingController();

String op1 = "USD";
String op2 = "USD";

List<DropdownMenuItem<String>> moneda = <DropdownMenuItem<String>>[
  DropdownMenuItem(value: "USD", child: Text("USD")),
  DropdownMenuItem(value: "EUR", child: Text("EUR")),
  DropdownMenuItem(value: "COP", child: Text("COP")),
];

List<calculadora> cal = <calculadora>[
  calculadora("9", Colors.lightGreen[100], Icon(Icons.abc)),
  calculadora("8", Colors.lightGreen[100], Icon(Icons.abc)),
  calculadora("7", Colors.lightGreen[100], Icon(Icons.abc)),
  calculadora("6", Colors.lightGreen[100], Icon(Icons.abc)),
  calculadora("5", Colors.lightGreen[100], Icon(Icons.abc)),
  calculadora("4", Colors.lightGreen[100], Icon(Icons.abc)),
  calculadora("3", Colors.lightGreen[100], Icon(Icons.abc)),
  calculadora("2", Colors.lightGreen[100], Icon(Icons.abc)),
  calculadora("1", Colors.lightGreen[100], Icon(Icons.abc)),
  calculadora("0", Colors.lightGreen[100], Icon(Icons.abc)),
  calculadora("Limpiar", Colors.lightBlue[200], Icon(Icons.cleaning_services)),
  calculadora("Calcular", Colors.lightBlue[200], Icon(Icons.calculate)),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Origen: "),
                  DropdownButton(
                      value: op1,
                      items: moneda,
                      onChanged: (String? X) {
                        setState(() {
                          op1 = X.toString();
                        });
                      }),
                  Text("Destino: "),
                  DropdownButton(
                      value: op2,
                      items: moneda,
                      onChanged: (String? X) {
                        setState(() {
                          op2 = X.toString();
                        });
                      }),
                ],
              ),
              TextField(
                controller: textOrigen,
                decoration: InputDecoration(
                    labelText: "Moneda origen",
                    hintText: "0",
                    icon: Icon(Icons.monetization_on)),
              ),
              TextField(
                controller: textDestino,
                decoration: InputDecoration(
                    enabled: false,
                    labelText: "Moneda destino",
                    hintText: "0",
                    icon: Icon(Icons.monetization_on)),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: cal.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: cal[index].color,
                      child: ListTile(
                        title: Center(
                          child: index > 9
                              ? cal[index].icono
                              : Text(
                                  cal[index].titulo,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                        ),
                        onTap: () {
                          if (index == 10) {
                            textOrigen.text = "";
                            textDestino.text = "";
                          } else if (index < 10) {
                            textOrigen.text =
                                textOrigen.text + cal[index].titulo;
                          } else {
                            if (op1 == op2) {
                              textDestino.text = textOrigen.text;
                            } else {
                              switch (op1) {
                                case "USD":
                                  if (op2 == "EUR") {
                                    textDestino.text =
                                        (double.parse(textOrigen.text) / 0.95)
                                            .toString();
                                  } else if (op2 == "COP") {
                                    textDestino.text =
                                        (double.parse(textOrigen.text) * 4800)
                                            .toString();
                                  }
                                  break;
                                case "EUR":
                                  if (op2 == "USD") {
                                    textDestino.text =
                                        (double.parse(textOrigen.text) * 0.95)
                                            .toString();
                                  } else if (op2 == "COP") {
                                    textDestino.text =
                                        (double.parse(textOrigen.text) * 5000)
                                            .toString();
                                  }
                                  break;
                                case "COP":
                                  if (op2 == "USD") {
                                    textDestino.text =
                                        (double.parse(textOrigen.text) / 4800)
                                            .toString();
                                  } else if (op2 == "EUR") {
                                    textDestino.text =
                                        (double.parse(textOrigen.text) / 5000)
                                            .toString();
                                  }
                                  break;
                                default:
                              }
                            }
                          }
                          print(cal[index].titulo);
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
