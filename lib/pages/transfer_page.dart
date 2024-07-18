import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App!!',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const TransferPage(title: 'Flutter Example App'),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => TransferPage(title: 'Transfer'),
        '/transfer': (context) => HomePage(title: 'Home'),
        '/cotac': (context) => HomePage(title: 'title'),
      },
    );
  }
}

class TransferPage extends StatelessWidget {
  const TransferPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.60,
                    color: Color.fromARGB(255, 0, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image.asset('images/Group5.png', height: 60, width: 60),
                            ],
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Qual é o valor \nda transferência?',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20), // Aumenta o espaçamento
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      prefixText: 'R\$ ',
                                      filled: true,
                                      fillColor: Color.fromARGB(255, 65, 65, 65),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0), // Ajuste este valor para alterar o raio da borda
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20), // Aumenta o espaçamento
                                  Text(
                                    'Para quem você \ndeseja transferir?',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20), // Aumenta o espaçamento
                                  TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromARGB(255, 65, 65, 65),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0), // Ajuste este valor para alterar o raio da borda
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.35), // Ajuste o segundo valor para mover o quadrado para cima ou para baixo
              child: GestureDetector(
                onTap: () {
                  print('botao precionado');
                },
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 1, 248, 143),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text(
                              'Tranferência',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white, // Adicionado para definir a cor de fundo do Scaffold
        );
    }
}