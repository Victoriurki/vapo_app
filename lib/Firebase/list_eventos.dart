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
  String? valor;
  List<String>? favorites;

  Event({
    this.id,
    this.nome,
    this.data,
    this.local,
    this.endereco,
    this.horario,
    this.instagram,
    this.image,
    this.valor,
    this.favorites,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'nome': nome,
        'data': data,
        'local': local,
        'endereco': endereco,
        'horario': horario,
        'instagram': instagram,
        'price': valor,      
        'image':image,
        'valor':valor,
        'favorites':favorites,

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
        valor: json['valor'],
        favorites: json['favorites'],
      );
}
