import 'package:flutter/material.dart';
import 'package:flutter_application_1/libary_funcao.dart';

class ConfigTela extends StatefulWidget {
  const ConfigTela({Key? key}) : super(key: key);

  @override
  State<ConfigTela> createState() => _ConfigTelaState();
}

class _ConfigTelaState extends State<ConfigTela> {
  bool ativaNoticacao = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      appBar: barraMenuWidget("Configurações da Tela"),
      body: Align(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            textoTitulo("Período de Inativia", Colors.white),

            const SizedBox(height: 20),

            //Relogio do Usuario
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Inicio do trafa
                widgetDialogoSmall("00", "", null, false),

                const SizedBox(width: 5),

                textoTitulo(":", Colors.white),

                const SizedBox(width: 5),

                widgetDialogoSmall("00", '', null, false),

                //Espaço
                const SizedBox(width: 20),
                textoPadrao("Até", Colors.white),
                const SizedBox(width: 20),

                //Fim
                widgetDialogoSmall("00", "", null, false),
                const SizedBox(width: 5),
                textoTitulo(":", Colors.white),
                const SizedBox(width: 5),
                widgetDialogoSmall("00", "", null, false),
              ],
            ),

            divisor(),

            //Habilitar Notificações
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //CrossAxisAlignment.center,

              children: [
                textoTitulo("Habilitar Notificação", Colors.white),
                Switch(
                  value: ativaNoticacao,
                  onChanged: (value) {
                    setState(() {
                      ativaNoticacao = value;
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                ),
              ],
            ),

            //Lista de Apps
            const SizedBox(height: 20),
            textoTitulo("Apps Desabilitados", Colors.white),
            const SizedBox(height: 20),
            const SizedBox(
              height: 100,
              width: 100,
            ),

            //ListView(),
          ],
        ),
      ),
    );
  }
}
