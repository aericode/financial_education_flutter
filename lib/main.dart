import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() async {
  runApp(const MyApp());
}

const request =
    "https://api.hgbrasil.com/finance?format=json-cors&key=7--no-sound-null-safety2697c9d";

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
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
  double ibovpoints = 0;
  double euro = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
          title: const Text("iBovespa hoje",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white)),
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
                      Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Image.asset('assets/bovespa.jpg', width: 300)),
                      Container(
                        // A fixed-height child.
                        alignment: Alignment.topCenter,
                        child: const Text(
                            'O Índice da Bolsa de Valores de São Paulo, também conhecido como IBOVESPA funciona como um termômetro do mercado acionário do Brasil',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child:
                              Image.asset('assets/construir.jpeg', width: 340)),
                      Container(
                        // A fixed-height child.
                        alignment: Alignment.topCenter,
                        child: const Text(
                            'Para medir este índice, são observados o valor de 92 ações de alta negociação na bolsa',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child:
                              Image.asset('assets/dinheiro.jpg', width: 340)),
                      Container(
                        // A fixed-height child.
                        alignment: Alignment.topCenter,
                        child: const Text(
                            'Esse conjunto de ações corresponde a cerca de 80% de todo o volume negociado na bolsa de valores brasileira',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Image.asset('assets/multiplica.jpeg',
                              width: 340)),
                      Container(
                        // A fixed-height child.
                        alignment: Alignment.topCenter,
                        child: const Text(
                            'Algumas ações tem influência maior do que outras nesse termômetro então cada uma é multiplicada por um "peso" e todas tem seu valor somado',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Image.asset('assets/grafico.png', width: 400)),
                      Container(
                        // A fixed-height child.
                        alignment: Alignment.topCenter,
                        child: const Text(
                            'Isso permite gerar um número e acompanhar em tempo real, a valorização ou desvalorização desse conjunto de ações, e extrair a partir dessa amostra informações sobre nossso mercado',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                      ),
                      Column(children: <Widget>[
                        Container(
                            // A fixed-height child.
                            padding: EdgeInsets.fromLTRB(0, 180, 0, 10),
                            alignment: Alignment.center,
                            child: Text('No momento o índice IBOVESPA está em',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30))),
                        FutureBuilder<Map>(
                            future: getData(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                case ConnectionState.active:
                                case ConnectionState.waiting:
                                  return const Center(
                                      child: Text(
                                    "Carregando dados...",
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 25.0),
                                    textAlign: TextAlign.center,
                                  ));
                                default:
                                  if (snapshot.hasError) {
                                    return const Center(
                                        child: Text(
                                      "Erro ao carregar dados...",
                                      style: TextStyle(
                                          color: Colors.amber, fontSize: 25.0),
                                      textAlign: TextAlign.center,
                                    ));
                                  } else {
                                    ibovpoints = snapshot.data!["results"]
                                        ["stocks"]["IBOVESPA"]["points"];

                                    return SingleChildScrollView(
                                        child: Text(ibovpoints.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 50,
                                                color: Colors.blue)));
                                  }
                              }
                            }),
                        Text('pontos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30))
                      ]),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 180, 0, 10),
                          child: Image.asset('assets/estacoes.jpg', width: 400)),
                      Container(
                        // A fixed-height child.
                        alignment: Alignment.topCenter,
                        child: const Text(
                            'Vale ressaltar que vários elementos associados a esse índice estão sujeitos à mudança. ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          child: Image.asset('assets/marcasbrasileiras.jpg', width: 400)),
                      Container(
                        // A fixed-height child.
                        alignment: Alignment.topCenter,
                        child: const Text(
                            'As empresas que compõem o índice variam, são revistas aproximadamente a cada três meses, e o número de empresas também não é fixo',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          child: Image.asset('assets/americanas.png', width: 400)),
                      Container(
                        // A fixed-height child.
                        alignment: Alignment.bottomCenter,
                        child: const Text(
                            'Além disso, a própria natureza dinâmica do mercado faz com que empresas ganhem e percam relevância dentro do próprio índice',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
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
