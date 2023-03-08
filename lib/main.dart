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
      title: 'Flutter Demo',
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
          title: const Text("iBovespa hoje",
              style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.green.shade900),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyMedium!,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      /*
                      Container(
                        // A fixed-height child.
                        color: const Color(0xffa97432), // Yellow
                        height: 120.0,
                        alignment: Alignment.center,
                        child: const Text('Bovespa Hoje',

                      ),*/
                      Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Image.asset('assets/bovespa.jpg', width: 300)
                      ),
                      Container(
                        // A fixed-height child.
                        alignment: Alignment.topCenter,
                        child: const Text(
                            'Conhecido como IBOV, o índice funciona como um termômetro do mercado acionário do Brasil',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                      ),
                      Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Image.asset('assets/grafico.png', width: 350)
                      ),
                      Container(
                        // A fixed-height child.
                        alignment: Alignment.topCenter,
                        child: const Text(
                            'É avaliada a flutuação de valor de um conjunto de ações com alta negociação na bolsa brasileira',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      Expanded(
                        // A flexible child that will grow to fit the viewport but
                        // still be at least as big as necessary to fit its contents.
                        child: Container( // Red
                          height: 1000.0,
                          alignment: Alignment.center,
                          child: const Text('Flexible Content'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
