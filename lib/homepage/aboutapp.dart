import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'About App',
          style: TextStyle(fontFamily: 'Alike'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 140),
              child: Text(
                'Food Recipe Application',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Alike'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Food Recipe App is a powerful application that'
                  ' teaches us on how cook our favourite dishes.'
                  ' A recipe is a set of instructions that describes how to prepare'
                  'or make something, especially a dish of prepared food.',
                  style: TextStyle(fontSize: 14, fontFamily: 'Alike'),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'img/pounded.jpg',
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              )),
          SizedBox(height: 20),
          Text(
            "Let's Cook it Up",
            style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.w300,
                fontSize: 30,
                fontFamily: 'Satisfy',
                ),
          )
        ],
      ),
    );
  }
}
