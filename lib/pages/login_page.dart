import 'package:byte_bank/auth/auth_service.dart';
import 'package:byte_bank/components/my_button.dart';
import 'package:byte_bank/components/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // controladores de texto do email e da senha
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  // método para clicar para ir para a página de login
   final void Function()? onTap;
   LoginPage({super.key, required this.onTap});

   // Login Método
  void login(BuildContext context) async {
  // auth service
    final authService = AuthService();

    // Try Login / tentar entrar
    try {
      await authService.signInWithEmailPassword(_emailController.text, _senhaController.text,);
    }
    // catch any error/ catar algum erro (catar é uma boa traduçãokkkkkk
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          )
      );
    }
  }

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
            Text('Bem Vindo de volta, sentimos sua falta',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.0
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

            const SizedBox(height: 25.0),

            // botão de login
            MyButton(
              text: 'ENTRAR',
              onTap: () => login(context),
            ),

            const SizedBox(height: 25.0),

            // registrar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Não tem uma conta? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text('Entre aqui!',
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
