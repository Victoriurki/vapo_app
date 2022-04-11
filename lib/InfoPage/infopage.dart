import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vapo_app/AppColors/colors_app.dart';
import 'package:vapo_app/Firebase/list_eventos.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  Stream<List<Event>> readUser() => FirebaseFirestore.instance
        .collection('eventos')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Event.fromJson(doc.data())).toList());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: StreamBuilder<List<Event>>(        
        stream: readUser(),
        builder: (context, snapshop) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/fillet.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(70),
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 2.0)
                      ],
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        snapshop.data![index].nome!,
                        style: GoogleFonts.concertOne(
                          textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ), //Style,
                      ),
                    ),
                  ),
                ], //Children
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: false,
                  children: <Widget>[
                    Card(
                      elevation: 5,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        leading: const Icon(Icons.access_alarm),
                        title: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  snapshop.data![index].data!,
                                  style: GoogleFonts.concertOne(
                                    color: AppColors.titlecolor,
                                    textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ), //Style
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Subtítulo 1",
                                  style: GoogleFonts.concertOne(
                                    color: AppColors.subtitlecolors,
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ), //Style
                                ),
                              ], //Children
                            ),
                          ], //Children
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading: const Icon(Icons.access_alarm),
                        title: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  snapshop.data![index].local!,
                                  style: GoogleFonts.concertOne(
                                    color: AppColors.titlecolor,
                                    textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ), //Style
                                ),
                              ], //Children
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Subtítulo 2",
                                  style: GoogleFonts.concertOne(
                                    color: AppColors.subtitlecolors,
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ), //Style
                                ),
                              ], //Children
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading: const Icon(Icons.access_alarm),
                        title: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Price",
                                  style: GoogleFonts.concertOne(
                                    color: AppColors.titlecolor,
                                    textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ), //Style
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Subtítulo 3",
                                  style: GoogleFonts.concertOne(
                                    color: AppColors.subtitlecolors,
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ), //Style
                                ),
                              ], //Children
                            ),
                          ], //Children
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading: const Icon(Icons.access_alarm),
                        title: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  snapshop.data![index].instagram!,
                                  style: GoogleFonts.concertOne(
                                    color: AppColors.titlecolor,
                                    textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ), //Style
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Subtítulo 4",
                                  style: GoogleFonts.concertOne(
                                    color: AppColors.subtitlecolors,
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ), //Style
                                ),
                              ],
                            ),
                          ], //Children
                        ),
                      ),
                    )
                  ],
                ),
              )
            ], //Children
          );
          
        },
        
      ),
      
    );
      } //InfoPage
}
