import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

//Função de inicial de chamada feito em dart
void main() {
  runApp(
    MaterialApp(
      title: "Tela de Login",
      debugShowCheckedModeBanner: false,
      initialRoute: '/t_Login',
      routes: {
        '/t_login' : (context) => const login(),
      },
      //home: login(),
    ),
  );
}

//Declaração de Tela Principal
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginEstado();
}

class _loginEstado extends State<login> {
  @override
  //Isso é estável
  Widget build(BuildContext context) {
    //Aqui Está o Widgets do APP
    return Scaffold(
      //BARRA DE MENU
      backgroundColor: Color.fromRGBO(23, 23, 23, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Login de Usuário',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      //CORPO PRINCIPAL
      body: Column(
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

          //Botão de Entrar e Cadastrar
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
                    /*
                    ButtonStyle(
                      //fixedSize: ,
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    */
                    onPressed: () {},
                    child: const Text("Entrar")),
              ),

              //Size Box é apenas para dar Espaço
              const SizedBox(width: 30),

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
                    onPressed: () {},
                    child: const Text("Cadastrar")),
              ),
            ],
          )

          /*
            SizedBox(
              TextButton(onPressed: onPressed, child: child)
            )
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                TextButton(onPressed: onPressed, child: child)
                
              ],
            ),
            */
        ],
      ),
    );
  }
}

//Aqui não possui um build por ser um stateful

//construa um widget e construa no contexto contexto
/*
  login (build(BuildContext context){
    return MaterialApp(
      title: 'Login'
    );
  }*/
