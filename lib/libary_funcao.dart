//Firebase Funções
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'bibliotecaDeFuncao/mensagem.dart';

//Variáveis Globais

//FUNÇÕES DA APLICAÇÃO

//Barra de Entrada de Dados
widgetDialogo(msgExter, msgInter, variavel, oculto) {
  return TextFormField(
      textAlign: TextAlign.center,
      controller: variavel,
      //Esaço do Usuárip

      //Variával que define se o texto é para senhas(ocultas);
      obscureText: oculto,
      decoration: InputDecoration(
          filled: true,
          hintText: msgInter,
          labelText: msgExter,
          fillColor: Colors.white,

          //TAMANHO DAS FONTES
          //EXTERNA
          labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
          hintStyle: const TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 162, 162, 162))));
}

//BARAR PRINCIPAL

barraMenuWidget(titulo) {
  return AppBar(
    backgroundColor: Colors.white,

    //Para mudar a cor do IconButton basta usar essa linha;
    iconTheme: const IconThemeData(color: Colors.black),
    title: Text(
      titulo,
      style: const TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
  );
}

widgetDialogoSmall(msgExter, msgInter, variavel, oculto) {
  return SizedBox(
    height: 70,
    width: 100,
    child: TextFormField(
        controller: variavel,

        //Variával que define se o texto é para senhas(ocultas);
        obscureText: oculto,
        decoration: InputDecoration(
            filled: true,
            hintText: msgInter,
            labelText: msgExter,
            fillColor: Colors.white,

            //TAMANHO DAS FONTES
            //EXTERNA
            labelStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            hintStyle: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 162, 162, 162)))),
  );
}

//Texto Padrão
textoPadrao(texto, cor) {
  return Text(
    texto,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: cor,
      fontSize: 20,
    ),
  );
}

//Texto Título
textoTitulo(texto, cor) {
  return Text(
    texto,
    style: TextStyle(
      color: cor,
      fontSize: 25,
    ),
  );
}

//Botão do Menu
botaoMenu(icone, texto, rota, contexto) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          icone,
          color: Colors.white,
          size: 40,
        ),
        iconSize: 40,
      ),
      TextButton(
        onPressed: () {
          Navigator.pushNamed(contexto, rota);
        },
        child: textoPadrao(
          texto,
          Colors.white,
        ),
      ),
    ],
  );
}

divisor() {
  return const Divider(
    height: 50,
    thickness: 2,
    indent: 200,
    endIndent: 200,
    color: Colors.grey,
  );
}

//
//LOGIN DO FIRE BASE
//

void login(context, email, senha) {
  FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: senha)
      .then((res) {
    //TUDO CERTO
    sucesso(context, 'Usuário autenticado com sucesso.');
    Navigator.pushReplacementNamed(context, 'principal');
  }).catchError((e) {
    switch (e.code) {
      case 'invalid-email':
        erro(context, 'O formato do email é inválido.');
        break;
      case 'user-not-found':
        erro(context, 'Usuário não encontrado.');
        break;
      case 'wrong-password':
        erro(context, 'Senha incorreta.');
        break;
      default:
        erro(context, e.code.toString());
    }
  });
}

void criarConta(context, nome, email, senha) {
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: senha)
      .then((res) {
    //TUDO CERTO!!
    sucesso(context, 'Usuário criado com sucesso!');
    Navigator.pop(context);
  }).catchError((e) {
    switch (e.code) {
      case 'invalid-email':
        erro(context, 'O formato do email é inválido.');
        break;
      case 'email-already-in-use':
        erro(context, 'O email já foi cadastrado.');
        break;
      default:
        erro(context, e.code.toString());
    }
  });
}

void loginConta(email, senha, context) {
  FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: senha)
      //Situações de Login
      .then((res) {
    //Login Efetuado com Sucesso
    //Mensagem
    sucesso(context, "Conta Logada Com Sucesso");
    //Rota
    Navigator.pushReplacementNamed(context, '/telaPrincipal');
  }).catchError((e) {
    //Erro no Login
    erro(context, "Alguma Coisa está errada");
  });
}
