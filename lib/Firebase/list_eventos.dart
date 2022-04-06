import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ListEventos{
String id;
final String nome;
final String data;
final String local;
final String endereco;
final String valor;
final String horario;
final String instagram;

ListEventos({

this.id = '',
required this.nome,
required this.data,
required this.local,
required this.endereco,
required this.valor,
required this.horario,
required this.instagram,

})

Map<String, dynamic> tojson() => {

'id': id,
'nome': nome,
'data': data,
'local': local,
'endereco':endereco,
'valor':valor,
'horario':horario,
'instagram':instagram,
};

static ListEventos fromJson (Map<String, dynamic> json) => ListEventos(
  id: json ['id'],
  nome: json['nome'],
  data: json['data'],
  local: json['local'],
  endereco: json['endereco'],
  valor: json['valor'],
  horario: json['horario'],
  instagram: json['instagram'],


);

}