//import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'bibliotecaDeFuncao/funcoesfirebase.dart';
import 'libary_funcao.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  var nomeusuario = '';

  @override
  /*
  void initState() {
    super.initState();
    userDB = FirebaseFirestore.instance.collection('DadosUsuarios');
  }*/

  nomeUsuarioChamda() async {
    await FirebaseFirestore.instance
        .collection('DadosUsuarios')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .get()
        .then((doc) {
      setState(() {
        nomeusuario = doc.get('nome');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      //Barra e Menu
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: FutureBuilder(
            future: nomeUsuarioChamda(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Text(
                    nomeusuario,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
            }),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            children: <Widget>[
              //Espaço entre entre barra e o icone
              const SizedBox(height: 30),

              //Botão Icone
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/listadeusuarios');
                },
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 120,
                ),
                iconSize: 120,
              ),

              const SizedBox(
                height: 30,
              ),

              //Botão do Nome do Usuário
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/listadeusuarios');
                },
                child: Text(
                  FirebaseAuth.instance.currentUser!.email.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Colors.white,
              ),

              //COMEÇA O MENU
              const SizedBox(height: 20),

              //Botão de Configurações do Usuário

              botaoMenu(Icons.manage_accounts, "Configurações da Conta",
                  '/configurausu', context),

              const SizedBox(height: 20),

              //Configuações da Tela
              botaoMenu(Icons.settings_cell, "Opções de Tela", '/configuraTela',
                  context),

              const SizedBox(height: 20),

              //Configurações do Bloqueio
              botaoMenu(Icons.settings_rounded, "Bloqueio do Aparelho",
                  '/bloqueioAparelho', context),

              const SizedBox(height: 20),

              //Suport US
              botaoMenu(
                  Icons.paypal, "Contribua Conosco", '/contribua', context),

              const SizedBox(height: 20),

              //Sobre nós
              botaoMenu(Icons.handshake, "Sobre Nós", '/sobreNos', context),
            ],
          ),
        ),
      ),
    );

    //Icone de Usuário

    //Email da Conta
  }
}
