import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vapo_app/Firebase/list_eventos.dart';

class Eventos extends StatefulWidget {
  const Eventos({Key? key}) : super(key: key);

  @override
  State<Eventos> createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos os Eventos'),
      ),
      body: StreamBuilder<List<ListEventos>>(
        stream: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final eventos = snapshot.data!;

            return ListView(
              children: [eventos.map((BuildUser).toList())],
            );
          }
        },
      ),
    );
  }

  Widget buildUser(ListEventos listEventos) => ListTile(
        leading: Text(ListEventos.nome),
        
      );

  Stream<List<ListEventos>> readUser() => FirebaseFirestore.instance
      .collection('eventos')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ListEventos.fromJson(doc.data()))
          .toList());
}
