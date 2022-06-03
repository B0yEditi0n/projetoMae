import 'package:flutter/material.dart';
import 'package:tails_mommy/bibliotecaDeFuncao/funcoesfirebase.dart';

import 'libary_funcao.dart';

class loginTela extends StatefulWidget {
  @override
  State<loginTela> createState() => _loginTelaEstado();
}

class _loginTelaEstado extends State<loginTela> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BARRA DE MENU
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      appBar: barraMenuWidget("Login de Usuário"),

      //CORPO PRINCIPAL
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          children: <Widget>[
            //Epaço
            const SizedBox(height: 30),

            //Icone de Usuário
            const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 120,
            ),

            const SizedBox(height: 50),

            //Entrda do Email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: txtEmail,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Coloque o Email",
                ),
              ),
            ),

            //Espaço
            const SizedBox(height: 10),

            //Entrada da Senha
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: txtSenha,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Coloque a Senha",
                ),
              ),
            ),

            //Espaço
            const SizedBox(height: 50),

            //Botão de Entrar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        loginConta(txtEmail.text, txtSenha.text, context);
                      },
                      child: const Text("Entrar")),
                ),

                const SizedBox(width: 30),

                //Botão de Cadastrar
                //Envolver um botão dentro de uma size box permite escolher
                // o tamanho do botão
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastroTela');
                      },
                      child: const Text("Cadastrar")),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
