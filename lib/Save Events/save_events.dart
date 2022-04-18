import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vapo_app/AppFont/fonts_app.dart';
import '../app_bar/first_bar.dart';
import 'package:vapo_app/Firebase/list_eventos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vapo_app/InfoPage/infopage.dart';

class SaveEvents extends StatefulWidget {
  const SaveEvents({Key? key}) : super(key: key);

  @override
  State<SaveEvents> createState() => _SaveEventsState();
}

class _SaveEventsState extends State<SaveEvents> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final userCollection = FirebaseFirestore.instance.collection("users");
  Stream<List<Event>> readUser() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .collection("favorite_events")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Event.fromJson(doc.data())).toList());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const FirstBar(),
        body: StreamBuilder<List<Event>>(
            stream: readUser(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active &&
                  snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      return Dismissible(
                        key: Key(snapshot.data![index].nome!),
                        onDismissed: (direction) {
                          setState(() {
                            final favoriteEvent = userCollection
                                .doc(currentUser!.uid)
                                .collection("favorite_events")
                                .doc(snapshot.data![index].id);
                            favoriteEvent.delete();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Event Unsaved')));
                        },
                        child: ListTile(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  InfoPage(event: snapshot.data![index]),
                            ),
                          ),
                          trailing: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          title: Text(
                            snapshot.data![index].nome!,
                            style: AppFont.titleapp,
                          ),
                          leading: Container(
                            height: 72.0,
                            width: 72.0,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(70),
                                      offset: const Offset(2.0, 2.0),
                                      blurRadius: 2.0)
                                ],
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    snapshot.data![index].image!,
                                  ),
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                      );
                    });
              } else {
                return const CircularProgressIndicator();
              }
            })));

  }
}
