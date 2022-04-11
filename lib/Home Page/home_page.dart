import 'package:flutter/material.dart';
import 'package:vapo_app/Firebase/eventos.dart';
import 'package:vapo_app/InfoPage/infopage.dart';
import 'package:vapo_app/appbars/first_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8"
  ];

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height * 0.4;

    final headerList = ListView.builder(
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
                color: Colors.lightGreen,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                image: const DecorationImage(
                  image: ExactAssetImage('images/fillet.jpeg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              //                                    height: 200.0,
              width: 200.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFF273A48),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0))),
                      height: 30.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            'Olá',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
    );

    return Scaffold(
      appBar: const FirstBar(),
      floatingActionButton: FloatingActionButton(onPressed: (() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const InfoPage()));
      })),
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
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 72.0,
                                  width: 72.0,
                                  decoration: BoxDecoration(
                                      color: Colors.lightGreen,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withAlpha(70),
                                            offset: const Offset(2.0, 2.0),
                                            blurRadius: 2.0)
                                      ],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12.0)),
                                      image: const DecorationImage(
                                        image: ExactAssetImage(
                                          'images/bailedamentira.jpeg',
                                        ),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Text(
                                        'My item header',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Item Subheader goes here\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.normal),
                                      )
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.shopping_cart,
                                  color: Color(0xFF273A48),
                                )
                              ],
                            ),
                            const Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
