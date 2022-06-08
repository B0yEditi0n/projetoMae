//import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tails_mommy/libary_funcao.dart';

class configuraUsuario extends StatefulWidget {
  const configuraUsuario({Key? key}) : super(key: key);

  @override
  State<configuraUsuario> createState() => _configuraUsuarioState();
}

class _configuraUsuarioState extends State<configuraUsuario> {
  //variável do firebase
  var dadoCarregado;

  //Controladores de Editor de Texto
  var txtNome = TextEditingController();
  var txtDataDay = TextEditingController();
  var txtDataMonth = TextEditingController();
  var txtDataYear = TextEditingController();

  @override
  PegarDados() async {
    await FirebaseFirestore.instance
        .collection('DadosUsuarios')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .get()
        .then((doc) {
      dadoCarregado = doc.get('nome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: barraMenuWidget("Configurações da Conta"),
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: PegarDados(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("Carregando");
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } /* else if (snapshot.connectionState == ConnectionState.none) {
                return const Center(
                    child: Text(
                        'o banco de dados está fora do ar ou você está sem internet'));
              }*/
              else {
                print('carregado');
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: Column(children: [
                      const SizedBox(height: 30),
                      const Divider(
                        height: 50,
                        thickness: 2,
                        indent: 400,
                        endIndent: 400,
                        color: Colors.grey,
                      ),

                      //
                      //Widgets das Configurações da Conta do Usuario
                      //
                      textoTitulo("Alterar Nome", Colors.white),
                      const SizedBox(height: 20),
                      widgetDialogo(txtNome, "Nome do Usuário", null, false),
                      const SizedBox(height: 30),

                      const Divider(
                        height: 50,
                        thickness: 2,
                        indent: 400,
                        endIndent: 400,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      textoTitulo("Data de Nascimento", Colors.white),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          widgetDialogoSmall("dd", "", null, false),
                          const SizedBox(width: 10),
                          widgetDialogoSmall("mm", "", null, false),
                          const SizedBox(width: 10),
                          widgetDialogoSmall("aa", "", null, false),
                        ],
                      ),

                      const SizedBox(height: 20),

                      const Divider(
                        height: 50,
                        thickness: 2,
                        indent: 400,
                        endIndent: 400,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      textoTitulo("Horário de sono", Colors.white),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widgetDialogoSmall("Início", "hh:Mm", null, false),
                          const SizedBox(
                            width: 10,
                          ),
                          widgetDialogoSmall("Término", "hh:Mm", null, false),
                        ],
                      ),

                      const SizedBox(height: 30),
                    ]),
                  ),
                );
              }
            }));
  }
}
