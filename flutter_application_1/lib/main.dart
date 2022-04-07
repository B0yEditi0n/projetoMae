import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC',
      home: TelaPrincipal(),
    ),
  );
}

//
// TELA PRINCIPAL
// Stateful = stf+TAB
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  
  //Declaração de atributos que serão utilizados
  //para receber os dados que o usuário digitar
  //no campo de texto
  var txtPeso = TextEditingController();
  var txtAltura = TextEditingController();



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BARRA TÍTULO
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Colors.green.shade900,
      ),
      backgroundColor: Colors.grey.shade100,
      //BODY
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children:  [
                const Icon(
                  Icons.people_alt,
                  size: 100,
                  color: Color.fromRGBO(27, 94, 32, 1),
                ),
                //
                campoTexto('Peso', txtPeso),
                const SizedBox(height: 20,),
                //
                campoTexto('Altura', txtAltura),
                const SizedBox(height:30,),
                //
                botao('calcular'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //
  // CAMPO DE TEXTO
  //
  campoTexto(rotulo, variavel){

    return TextFormField(
      //associar a variável que receberá o valor
      //digitado no campo de texto
      controller: variavel,

      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: const TextStyle(
          fontSize: 22,
          color: Color.fromRGBO(27, 94, 32, 0.5),
        ),

        hintText: 'Informe o valor',
        hintStyle: const TextStyle(
          fontSize: 22,
          color: Color.fromRGBO(27, 94, 32, 0.5),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),

      ),
    );

  }

  /*
  BOTÃO
  */
  botao(rotulo){
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        //EVento que o ocorerrá quando o usuário adicionar
        //o botão
        onPressed: (){
        //o que acontece quando o usário aperta o botão é definido
        //aqui
          //recuperar os dados informados pelo usuário
          setState(() { /*Usado para manipular informações 
          Enviar e receber informações*/
            double p = double.parse(txtPeso.text.replaceFirst(',','.'));
            double a = double.parse(txtAltura.text.replaceFirst(',','.'));
            //parse é uma conversão de um tipo para outro
            double i = p/pow(a,2);

            caixaDialogo('o valor do IMC é ${i.toStringAsFixed(2)}');
            //$ siginifica que você exibirá o valor de uma viável  
          });
        },
        child: Text(
          rotulo, 
          style: const TextStyle(fontSize: 22),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
      ),
    );
  }
  /*
  CAIXA DE DIÁLOGO
  */
  caixaDialogo(msg){
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          content: Text(msg),
          actions: [
            TextButton(onPressed: (){Navigator.of(context).pop();
            },
            child:  const Text('fechar')
            )
          ],
        );
      },
      );
  }

}
