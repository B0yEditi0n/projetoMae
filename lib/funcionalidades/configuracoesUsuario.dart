//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tails_mommy/libary_funcao.dart';


class configuraUsuario extends StatefulWidget {
  const configuraUsuario({ Key? key }) : super(key: key);

  @override
  State<configuraUsuario> createState() => _configuraUsuarioState();
}

class _configuraUsuarioState extends State<configuraUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraMenuWidget("Configurações da Conta"),
      backgroundColor: Colors.black,

      body: SingleChildScrollView(
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
            textoTitulo("Alterar Nome", Colors.white),
            const SizedBox(height: 20),
            widgetDialogo("", "Nome do Usuário", null, false),
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
                const SizedBox(width: 10,),
                widgetDialogoSmall("Término", "hh:Mm", null, false),
              ],
            ),
            
            const SizedBox(height: 30),


            /*CupertinoDatePicker(mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime(1969, 1, 1),
                onDateTimeChanged: (DateTime newDateTime) {
                  // Do something
                },)*/
          ]),
        ),
        ),
      
    );
  }
}
