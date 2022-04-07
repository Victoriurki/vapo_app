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
      body: StreamBuilder<List<Event>>(
        stream: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final eventos = snapshot.data!;
            return ListView(
              children: eventos.map((event) => buildUser(event)).toList(),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget buildUser(Event event) => Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Text('Imagem'),
              title: Text(event.nome!),
              subtitle: Text(event.data!),
            ),
            Row(
              children: [Text(event.local!)],
            )
          ],
        ),
      );

  Stream<List<Event>> readUser() => FirebaseFirestore.instance
      .collection('eventos')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Event.fromJson(doc.data())).toList());
}
