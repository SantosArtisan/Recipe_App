

import 'package:flutter/material.dart';


class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool isSearching=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: !isSearching ? Text('About', style: TextStyle(fontFamily: 'Alike'),): 
        TextField(style: TextStyle (color:Colors.white,fontFamily: 'Alike'),
          decoration: InputDecoration( icon: Icon(Icons.search, color:Colors.white),
            hintText: 'Search Here', hintStyle: TextStyle(color: Colors.white),
           
          ),
        ),
        actions: <Widget>[
          isSearching ?
          IconButton(icon: Icon(Icons.cancel), onPressed: (){
            setState(() {
              this.isSearching=false;
            });

          }):
          IconButton(icon: Icon(Icons.search), onPressed: (){
            setState(() {
              this.isSearching=true;
            });
          })
        ],
      ),
      body: Column(
        children:<Widget>[
          Container(
            child: Column(
              children:<Widget>[
                ListTile( onTap: (){
                  Navigator.of(context).pushNamed('/aboutapp');
                },
                  leading:Icon(Icons.person_pin_circle), title: Text('About App',
                  style: TextStyle(fontFamily: 'Alike'),
                  ),
                  trailing: Icon(Icons.arrow_right),
                ),
                 ListTile( onTap: (){
                   Navigator.of(context).pushNamed('/developer');
                 },
                  leading:Icon(Icons.person_pin_circle), title: Text('About Developer',
                  style: TextStyle(fontFamily: 'Alike'),
                  ),
                  trailing: Icon(Icons.arrow_right),
                ),
                
              ]
            ),
          )
        ]
      ),

      drawer:Drawer(
        child: ListView(
          children: <Widget>[
             UserAccountsDrawerHeader(
              accountName: Text('Sani Abdullahi') ,
              accountEmail: Text('saniabdullahi442@gmail.com'),
              currentAccountPicture: CircleAvatar(
                radius: 50,
               child: Icon(Icons.restaurant_menu, size: 60, color: Colors.grey),
               backgroundColor: Colors.grey[200],
                
              ), 
            
            ),
             ListTile( onTap: (){
              Navigator.pop(context);
            },
              leading: Icon(Icons.home), title: Text('Home'),
              trailing: Icon(Icons.arrow_right),
            ),

            ListTile( onTap: (){
              Navigator.of(context).pushNamed('/feedback');
            },
              leading: Icon(Icons.feedback), title: Text('Feedback'),
              trailing: Icon(Icons.arrow_right),
            ),
            
            ListTile(onTap: (){
              Navigator.of(context).pushNamed('/category');
            },
              leading: Icon(Icons.category), title: Text('Category'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(onTap: (){
              Navigator.of(context).pushNamed('/about');
            },
              leading: Icon(Icons.info), title: Text('About'),
              trailing: Icon(Icons.arrow_right),
            ),    
            
           
            
            
          ],
        ),
      ),
      
    );
  }
}