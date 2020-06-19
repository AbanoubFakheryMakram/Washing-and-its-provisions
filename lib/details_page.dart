import 'dart:io';

import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String details;

  const DetailsPage({
    Key key,
    @required this.details,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double defaultSize = 20;

  List<String> actions = [
    'الرئيسيه',
    'خروج',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9E79F),
      appBar: AppBar(
        title: Text('الغسل واحكامه'),
        leading: SizedBox.shrink(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          IconButton(
            icon: Icon(Icons.zoom_in),
            onPressed: () {
              defaultSize = defaultSize + 2;
              setState(() {});
            },
          ),
          IconButton(
            icon: Icon(Icons.zoom_out),
            onPressed: () {
              if (defaultSize > 20) {
                defaultSize = defaultSize - 2;
                setState(() {});
              }
            },
          ),
          PopupMenuButton<String>(
            onSelected: selectAction,
            itemBuilder: (context) {
              return actions.map((currntAction) {
                return PopupMenuItem<String>(
                  value: currntAction,
                  child: Text(currntAction),
                );
              }).toList();
            },
          ),
        ],
        backgroundColor: Color(0xff756D04),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: RichText(
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.details,
                  style: TextStyle(
                    color: Color(0xff756D04),
                    fontSize: defaultSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectAction(String action) {
    if (action == 'خروج') {
      exit(0);
    } else {
      Navigator.of(context).pop();
    }
  }
}
