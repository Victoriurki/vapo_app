import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vapo_app/AppColors/colors_app.dart';
import 'package:vapo_app/Firebase/list_eventos.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatelessWidget {
  final Event event;
  const InfoPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(event.image!),
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
                      event.nome!,
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
                      leading: Icon(
                        Icons.calendar_today,
                        color: AppColors.gradientcolorB,
                      ),
                      title: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                event.data!,
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
                                "",
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
                      onTap: () {
                        if (event.local! == "A definir")
                          return null;
                        else
                          (launch(
                              "https://www.google.com.br/maps/place/${event.endereco!}"));
                      },
                      leading: Icon(
                        Icons.location_on,
                        color: AppColors.gradientcolorB,
                      ),
                      title: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                event.local!,
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
                                event.endereco!,
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
                      leading: Icon(
                        Icons.credit_card,
                        color: AppColors.gradientcolorB,
                      ),
                      title: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                event.valor!,
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
                                "",
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
                      onTap: () {
                        launch("https://www.instagram.com/${event.instagram!}/");
                      },
                      leading: Icon(
                        FontAwesomeIcons.instagram,
                        color: AppColors.gradientcolorB,
                      ),
                      title: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "@${event.instagram!}",
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
                                "",
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
        ),
      ),
    );
  } //InfoPage
}
