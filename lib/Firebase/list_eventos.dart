import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Event {
  String? id;
  String? nome;
  String? data;
  String? local;
  String? endereco;
  String? horario;
  String? instagram;
  String? image;

  Event({
    this.id,
    this.nome,
    this.data,
    this.local,
    this.endereco,
    this.horario,
    this.instagram,
    this.image,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'nome': nome,
        'data': data,
        'local': local,
        'endereco':endereco,
        'horario':horario,
        'instagram':instagram,
        'image':image,
      };

  static Event fromJson(Map<String, dynamic> json) => Event(
        id: json['id'],
        nome: json['nome'],
        data: json['data'],
        local: json['local'],
        endereco: json['endereco'],
        horario: json['horario'],
        instagram: json['instagram'],
        image: json['image'],
      );
}
