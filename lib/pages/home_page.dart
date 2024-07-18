import 'package:byte_bank/pages/cotac_page.dart';
import 'package:byte_bank/pages/transfer_page.dart';
import 'package:flutter/material.dart';
import '../auth/auth_service.dart';

void logout() {
  // esse metodo aqui desgraçado pega o auth service
  final _auth = AuthService();
  _auth.signOut();
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  void logout() {
    // esse metodo aqui desgraçado pega o auth service
    final _auth = AuthService();
    _auth.signOut();
  }

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
      home: const MyHomePage(title: 'Flutter Example App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Changa',
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey.shade400,
        actions: const [
          IconButton(onPressed: logout, icon: Icon(Icons.logout))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  color: Color.fromARGB(255, 0, 0, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Image.asset('images/Vector.png', height: 70, width: 70,),
                            Text(
                              'Usuário',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
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
                                  'saldo em conta:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Changa',
                                  ),
                                ),
                                Text(
                                  'R\$ 0,00',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Changa',
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
          Positioned(
            top: MediaQuery.of(context).size.height / 3.7,
            left: MediaQuery.of(context).size.width / 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context,).pushReplacement(
                    MaterialPageRoute(builder: (context) => TransferPage(title: 'title') ));
              },
              child: Container(
                width: 166,
                height: 126,
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
                      Align(
                        alignment: Alignment.topRight,
                        child: Image.asset('images/Data_Transfer.png', height: 28, width: 28),
                      ),
                      Text(
                        'Transferências',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'Changa',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height / 3.7,
            right: MediaQuery.of(context).size.width / 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context,).pushReplacement(
                    MaterialPageRoute(builder: (context) => const CotacPage() ));
              },
              child: Container(
                width: 166,
                height: 126,
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
                      Align(
                        alignment: Alignment.topRight,
                        child: Image.asset('images/Combo_Chart.png', height: 28, width: 28),
                      ),
                      Text(
                        'Cotação',
                        style: TextStyle(
                          fontFamily: 'Changa',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
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

