import 'dart:async';
import 'package:flutter/material.dart';
import 'package:recipeapp/homepage/developer.dart';
import 'package:recipeapp/homepage/feedback.dart';
import 'homepage/aboutapp.dart';
import 'homepage/category.dart';
import 'homepage/about.dart';
import 'homepage/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
      '/developer': (BuildContext context)=>Developer(),
      '/aboutapp': (BuildContext context)=>AboutApp(),
      '/about': (BuildContext context)=>About(),
       '/feedback': (BuildContext context)=>MyFeedback(),
       '/category': (BuildContext context)=>Category(),
      },
      title: 'Food Recipe App',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
    void initState() { 
      super.initState();
      Timer(Duration(seconds: 5), route); 
    }
    route(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.red,  
body:Stack(
fit: StackFit.expand,
        children: <Widget>[ 
          Container(
            decoration: BoxDecoration(color: Colors.red)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Icon(Icons.restaurant_menu, size: 100.0, color: Colors.grey[200],),
                      // CircleAvatar(
                      //   backgroundImage: AssetImage('img/chef.jpg'),
                      //   radius: 100.0,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0), 
                        ),
                        Text(
                          "Recipe App", 
                          style: TextStyle(color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Alike',
                          ),
                        ),
                    ],

                  ),
                ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(backgroundColor: Colors.white),
                      Padding(padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        "Let's Cook it Up",
                        style: TextStyle(color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Satisfy',
                        ),
                        
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  final List<Widget>_children=[HomePage(), MyFeedback(), Category(), About(),];

  void itemTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  
  bool isSearching=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Stack(
            fit:StackFit.expand,
            children: <Widget>[
              _children[_currentIndex],
            ],
          ),
        
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 10,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,), title: Text('Home', style: TextStyle(color: Colors.black,),)),
          BottomNavigationBarItem(icon: Icon(Icons.feedback, color: Colors.black,), title: Text('Feedback', style: TextStyle(color: Colors.black),)),
          BottomNavigationBarItem(icon: Icon(Icons.category, color: Colors.black,), title: Text('Category', style: TextStyle(color: Colors.black),)),
          BottomNavigationBarItem(icon: Icon(Icons.info, color: Colors.black,), title: Text('About', style: TextStyle(color: Colors.black),)),
        ],

        currentIndex: _currentIndex,
        onTap: itemTapped,
        
        ),

    );
  }

}




