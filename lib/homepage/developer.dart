import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Developer extends StatefulWidget {
  @override
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('About Developer'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 140),
            child: Container(
                child: Text(
              'Powered and Supported by:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Alike',
              ),
            )),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset('img/teamcd.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 140.0),
            child: Container(
              child: Text(
                'Developed and Designed by:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Alike',
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 250,
              width: 350,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.person_pin),
                        ),
                        Text(
                          'Sani Abdullahi',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Alike',
                          ),
                        )
                      ],
                    ),
                    Divider(height: 20),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.phone),
                        ),
                        Text(
                          '08165426897 or 09061993111',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Alike',
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 20),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.email),
                        ),
                        Text(
                          'saniabdullahi442@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Alike',
                          ),
                        )
                      ],
                    ),
                    Divider(height: 20),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(FontAwesomeIcons.github),
                        ),
                        Text(
                          'SantosArtisan',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Alike',
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 20),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(FontAwesomeIcons.whatsapp),
                        ),
                        Text(
                          '08165426897',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Alike',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
