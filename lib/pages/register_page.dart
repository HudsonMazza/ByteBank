import 'package:byte_bank/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  // controladores de texto do email e da senha
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

// método que troca a terna de cadastro para login
  void Function()? onTap;

  RegisterPage({super.key, required this.onTap});
  // Método de cadastro
  void register(BuildContext context) {
    // esse método pega o auth service para poder ser feito o cadastro
    final _auth = AuthService();

    // Confirma se a senha é igual, se sim cria usuario
    if (_senhaController.text == _confirmController.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _senhaController.text,
        );
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
            ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("A senha não é igual, corrija!"),
        ),
      );
    }
  }
  // se a senha não for igual, avisa o usuario pra consertar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO DO ByteBank
            Container(
              width: 145,
              height: 188,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('images/Group2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 25),
            // MENSAGEM DE BOAS VINDAS
            Text('Crie sua conta, é bem rapidinho ;) !',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0
              ),
            ),

            const SizedBox(height: 25.0),

            // campo de e-mail
            MyTextField(
              hintText: "e-mail",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10.0),

            // campo de senha
            MyTextField(
              hintText: "senha",
              obscureText: true,
              controller: _senhaController,
            ),

            const SizedBox(height: 10.0),

            // campo de confirmação de senha
            MyTextField(
              hintText: "confirme sua senha",
              obscureText: true,
              controller: _confirmController,
            ),


            const SizedBox(height: 25.0),

            // botão de login
            MyButton(
              text: 'CADASTRAR',
              onTap: () => register(context),
            ),

            const SizedBox(height: 25.0),
            // registrar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Já tem uma conta?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text('clique aqui!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
