//Firebase Funções
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'mensagem.dart';
import 'package:flutter/material.dart';

//
//FUNÇÕES DO FIREBASE
//

void criarConta(email, senha, nome, context) {
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: senha)
      .then((res) {
    //TUDO CERTO!!
    sucesso(context, 'Usuário criado com sucesso!');
    //REGISTRO DE DADOS

    FirebaseFirestore.instance.collection('DadosUsuarios').doc(FirebaseAuth.instance.currentUser!.uid.toString(),).set(
      {
        "nome": nome,
      },
    );
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

//Ler dados dentro da Rota

chamaDado(id) async {
  CollectionReference userDB = FirebaseFirestore.instance.collection('DadosUsuarios');
   DocumentSnapshot dadoDB = await userDB.doc(id).get();
  print('tentativa 1 ${dadoDB.id}');
  //print(dadoDB.['nome']);
  return dadoDB.id;

}