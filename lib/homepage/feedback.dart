import 'package:flutter/material.dart';

class MyFeedback extends StatefulWidget {
  @override
  _MyFeedbackState createState() => _MyFeedbackState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
_showSnackBar() {
  final snackbar = new SnackBar(
    content: new Text('Message Sent Successfully',
        style: TextStyle(
          fontSize: 16.0, 
          color: Colors.red,
          fontFamily: 'Alike',
          )),
          duration: new Duration(seconds: 3),
          backgroundColor: Colors.black87,
  );

  _scaffoldKey.currentState.showSnackBar(snackbar);
}

class _MyFeedbackState extends State<MyFeedback> {
  bool isLoading = false;

  void _feedbck() async {
    _showSnackBar();

    setState(() {
      isLoading = false;
    });
  }
  final _formkey = GlobalKey <FormState>();
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: !isSearching
            ? Text(
                'Feedback',
                style: TextStyle(fontFamily: 'Alike'),
              )
            : TextField(
                style: TextStyle(color: Colors.white, fontFamily: 'Alike'),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Search Here',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0, right: 220.0),
              child: Container(
                child: Text(
                  'Send Feedback',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alike'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Form(
                key: _formkey,
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'FullName',
                    ),
                    validator: (value){
                       if (value.isEmpty) {
                      return 'Fullname cannot be Empty';
                    }else{
                      return null;
                    }
                  }
                   
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Mobile No',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'City',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                child: TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Message',
                  ),
                  validator: (value){
                    if (value.isEmpty) {
                      return 'Message cannot be Empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
                child: FlatButton(
              child: Text('Send'),
              textColor: Colors.white,
              color: Colors.black,
              onPressed: () {
                if (_formkey.currentState.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                    _feedbck();
                }
              }
               
            )),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Sani Abdullahi'),
              accountEmail: Text('saniabdullahi442@gmail.com'),
              currentAccountPicture: CircleAvatar(
                radius: 50,
                child:
                    Icon(Icons.restaurant_menu, size: 60, color: Colors.grey),
                backgroundColor: Colors.grey[200],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.home),
              title: Text('Home'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/feedback');
              },
              leading: Icon(Icons.feedback),
              title: Text('Feedback'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/category');
              },
              leading: Icon(Icons.category),
              title: Text('Category'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/about');
              },
              leading: Icon(Icons.info),
              title: Text('About'),
              trailing: Icon(Icons.arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}
