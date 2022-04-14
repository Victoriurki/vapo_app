import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vapo_app/AppFont/fonts_app.dart';
import 'package:vapo_app/Firebase/list_eventos.dart';
import 'package:vapo_app/InfoPage/infopage.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Vapo',
        style: AppFont.vapo2,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<Event> events = <Event>[];

  Future<List<Event>> readUser() async {
    final documents =
        await FirebaseFirestore.instance.collection("eventos").get();
    final eventList =
        documents.docs.map((doc) => Event.fromJson(doc.data())).toList();
    events = eventList;
    return eventList;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    readUser();
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    Event? selectedEvent;

    for (var event in events) {
      if (event.nome!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(event.nome!);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            for (final event in events) {
              if (result == event.nome) {
                selectedEvent = event;
              }
          
            }
            if (selectedEvent != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InfoPage(event: selectedEvent!)));
            }
           
          },
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var event in events) {
      if (event.nome!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(event.nome!);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
