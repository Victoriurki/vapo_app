import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vapo_app/AppColors/colors_app.dart';
import 'package:vapo_app/AppFont/fonts_app.dart';
import 'package:vapo_app/Firebase/eventos.dart';
import 'package:vapo_app/InfoPage/infopage.dart';
import 'package:vapo_app/Save%20Events/save_events.dart';
import 'package:vapo_app/Search%20Page/search_page.dart';
import 'package:vapo_app/appbars/first_bar.dart';
import '../Firebase/list_eventos.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stream<List<Event>> readUser() => FirebaseFirestore.instance
      .collection('eventos')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Event.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height * 0.4;

    final headerList = StreamBuilder<List<Event>>(
        stream: readUser(),
        builder: ((context, snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) {
              EdgeInsets padding = index == 0
                  ? const EdgeInsets.only(
                      left: 20.0, right: 10.0, top: 4.0, bottom: 30.0)
                  : const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 4.0, bottom: 30.0);

              return Padding(
                padding: padding,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(4, 4),
                              blurRadius: 4)
                        ],
                        image: DecorationImage(
                            image: NetworkImage(snapshot.data![index].image!),
                            fit: BoxFit.fill)),
                    //                                    height: 200.0,
                    width: 300.0,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(4, 4),
                                        blurRadius: 4)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0))),
                              height: 70.0,
                              width: 400,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data![index].nome!,
                                        style: AppFont.titleapp,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Icon(
                                        Icons.calendar_today,
                                        color: Color(0xff8E00FE),
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        snapshot.data![index].data!,
                                        style: AppFont.titleapp3,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Color(0xff8E00FE),
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        snapshot.data![index].local!,
                                        style: AppFont.titleapp3,
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
          );
        }));

    return Scaffold(
      appBar: const FirstBar(),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Recent Items',
                        style: TextStyle(color: Colors.white70),
                      )),
                ),
                SizedBox(height: _height, width: _width, child: headerList),
                StreamBuilder<List<Event>>(
                    stream: readUser(),
                    builder: ((context, snapshot) {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 72.0,
                                        width: 72.0,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withAlpha(70),
                                                  offset:
                                                      const Offset(2.0, 2.0),
                                                  blurRadius: 2.0)
                                            ],
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(12.0)),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                snapshot.data![index].image!,
                                              ),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data![index].nome!,
                                                  style: AppFont.titleapp2,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.calendar_today,
                                                  color: Colors.grey,
                                                  size: 15,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  snapshot.data![index].data!,
                                                  style: AppFont.subtitleapp,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Colors.grey,
                                                  size: 15,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  snapshot.data![index].local!,
                                                  style: AppFont.subtitleapp,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const Icon(Icons.bookmark_border)
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              ),
                            );
                          },
                          itemCount: snapshot.data!.length,
                        ),
                      );
                    }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
