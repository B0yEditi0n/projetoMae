import 'dart:convert';

class UsuariosBd {
  String id;
  String nome;
  String email;
  String dia;
  String mes;
  String ano;
  String horaDormir;
  String horaAcordar;

  UsuariosBd(
    this.id,
    this.nome,
    this.email,
    this.dia,
    this.mes,
    this.ano,
    this.horaDormir,
    this.horaAcordar,
  );

  //
  // Transformar os dados no formato JSON em
  // um objeto
  factory UsuariosBd.fromJson(Map<String, dynamic> json) {
    return UsuariosBd(
      json['id'],
      json["nome"],
      json["email"],
      json["data_nascimento"]["dia"],
      json["data_nascimento"]["mes"],
      json["data_nascimento"]["ano"],
      json["sono_regular"]["horario_de_dormir"],
      json["sono_regular"]["horario_de_acordar"],
    );
  }
}
