//Teste de Criação
import 'package:flutter/cupertino.dart';

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
  //Controladores de Editor de Texto
  var txtNome = TextEditingController();

  //Data de Nascimento
  var dataNasc = Timestamp(0, 0);
  var txtDataDay = TextEditingController();
  var txtDataMonth = TextEditingController();
  var txtDataYear = TextEditingController();

  //Hora de Sono
  var horaSono_inicio = Timestamp(0, 0);
  var horaSono_fim = Timestamp(0, 0);
  var txtHora_i = TextEditingController();
  var txtHora_f = TextEditingController();

  @override
  PegarDados() async {
    await FirebaseFirestore.instance
        .collection('DadosUsuarios')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .get()
        .then((doc) {
      txtNome.text = doc.get('nome');
      dataNasc = (doc.get('dataNasc'));
      horaSono_inicio = (doc.get('horaSono'));
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
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                //
                //Atribuir Valores do FireBase
                //

                //Data
                txtDataYear.text = dataNasc.toDate().year.toString();
                txtDataMonth.text = dataNasc.toDate().month.toString();
                txtDataDay.text = dataNasc.toDate().day.toString();
                //Hora
                txtHora_i.text =
                    '${horaSono_inicio.toDate().hour.toString()}:${horaSono_inicio.toDate().minute.toString()}';
                txtHora_f.text = horaSono_inicio.toDate().minute.toString();

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
                      widgetDialogo(
                          "Nome de Usuario", "Nome do Usuário", txtNome, false),
                      const SizedBox(height: 30),

                      const Divider(
                        height: 50,
                        thickness: 2,
                        indent: 400,
                        endIndent: 400,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 10),

                      //Data de Nascimento

                      textoTitulo("Data de Nascimento", Colors.white),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          widgetDialogoSmall("dd", "", txtDataDay, false),
                          const SizedBox(width: 10),
                          widgetDialogoSmall("mm", "", txtDataMonth, false),
                          const SizedBox(width: 10),
                          widgetDialogoSmall("aa", "", txtDataYear, false),
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
                          widgetDialogoSmall(
                              "Início", "hh:Mm", txtHora_i, false),
                          const SizedBox(
                            width: 10,
                          ),
                          widgetDialogoSmall(
                              "Término", "hh:Mm", txtHora_f, false),
                        ],
                      ),

                      const SizedBox(height: 30),

                      const Divider(
                        height: 50,
                        thickness: 2,
                        indent: 400,
                        endIndent: 400,
                        color: Colors.grey,
                      ),

                      //Botão de Salvar

                      SizedBox(
                        width: 100,
                        height: 60,
                        child: TextButton(
                          onPressed: () {
                            //Conversão de Data
                            var data = DateTime.utc(
                                int.parse(txtDataYear.text),
                                int.parse(txtDataMonth.text),
                                int.parse(txtDataDay.text));

                            //Convesão Hora
                            var hora = DateTime.parse(
                                '2000-01-30 ${txtHora_i.text}:00');
                            print(Timestamp.fromMillisecondsSinceEpoch(
                                data.millisecondsSinceEpoch));
                            print(
                                hora.hour.toString() + hora.minute.toString());

                            /*
                            FirebaseFirestore.instance.collection('DadosUsuarios').doc(FirebaseAuth.instance.currentUser!.uid.toString(),).set({
                              "nome": txtNome.text,
                              "dataNasc": Timestamp.fromMillisecondsSinceEpoch(DateTime.parse(data).millisecondsSinceEpoch),
                              "horaSono": Timestamp.fromMillisecondsSinceEpoch(DateTime.parse(hora).millisecondsSinceEpoch),
                              },
                            );*/
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              primary: Colors.black),
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Salvar'),
                              Icon(Icons.save),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                );
              }
            }));
  }
}
