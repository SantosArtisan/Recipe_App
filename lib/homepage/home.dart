
import 'package:flutter/material.dart';
import 'package:recipeapp/util/data.dart';

import '../details.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isSearching=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: !isSearching ? Text('Food Recipe', style: TextStyle(fontFamily: 'Alike'),): 
        TextField(style: TextStyle (color:Colors.white,fontFamily: 'Alike'),cursorColor: Colors.white,
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
      body: ListView(
        children: <Widget>[
          Stack(
            children:<Widget>[
              Column(
                children: [
                  Container(
                    height:200,
                    decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('img/pounded.jpg'),
                  fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150))
            ),
          ),
          Container(
            height:20.0,
            child:Text('')
          )
       ],
    ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Container(
                    height:50,
                    width:200,
                    decoration: BoxDecoration(
                      color:Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: Center(child: Text("Let's Cook It Up", 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'Alike'),
                    )
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.fromLTRB(8.0, 10, 8.0, 10),
              child: Column(
                children: [
                  Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Text('Category',
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontFamily: 'Alike',
                             ),
                         ),
                        FlatButton(onPressed: (){},
                          child: Text('View More',
                          style: TextStyle(color: Colors.grey,
                          fontFamily: 'Alike',
                          ),
                          ),),
                       ],
                     ),

            Container(
             height:175,
             child:ListView.builder(
               scrollDirection: Axis.horizontal,
               shrinkWrap: true,
               itemCount: recipes.length,
               itemBuilder: (BuildContext context, int index){
                 Map recipe = recipes[index];
                 return GestureDetector(
                   onTap:(){
                     Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                       return Details(food: recipes, index: index,);
                     }));
                   },
                     child: Container(
                       width:120,
                       child:Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: <Widget>[
                          ClipRRect(
                             borderRadius: BorderRadius.circular(20),
                             child: Card(
                              child: Column(
                                 children:<Widget>[
                                   Image.asset("${recipe["img"]}",
                                   height:110,
                                   fit: BoxFit.cover,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(height:8.0),
                                      Text(recipe["name"], style: TextStyle(color: Colors.red, fontSize: 11, fontWeight: FontWeight.w600,fontFamily: 'Alike',),),
                                      SizedBox(height:8.0),
                                      Text('Click to View Recipe', style: TextStyle(color: Colors.red, fontSize: 12,fontWeight: FontWeight.w600, fontFamily: 'Satisfy',),),
                                      SizedBox(height: 10.0,)
                                    ],
                                  )
                                 ]
                               ),
                             )
                           ),
                        ],
                       )
                   ),
                 );
               }
             )
           ), 


            Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Text('Popular Search',
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontFamily: 'Alike',
                  ),
                 ),
               
                  FlatButton(onPressed: (){},
                    child: Text('View More',
                    style: TextStyle(color: Colors.grey,
                    fontFamily: 'Alike',
                    ),
                    ),),
                 ],
               ), 

            GridView.builder(
                   shrinkWrap: true,
                   primary: false,
                  itemCount: recipes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
                  itemBuilder: (BuildContext context, int index) {
                    Map recipe = recipes[index];
                    return InkWell(
                      splashColor: Colors.grey[200],
                      onTap:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context,){
                          return Details(food: recipes, index: index,);
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child:Card(
                                      elevation: 5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children:<Widget>[
                                          Image.asset(recipe["img"],
                                            fit: BoxFit.cover,
                                            height: MediaQuery.of(context).size.height*0.2,
                                          ),

                                         Column(
                                    children: [
                                      SizedBox(height:8.0),
                                      Text(recipe["name"], style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Alike',),),
                                      SizedBox(height:8.0),
                                      Text('Click to View Recipe', style: TextStyle(color: Colors.red, fontSize: 12,fontWeight: FontWeight.w600, fontFamily: 'Satisfy',),),
                                     
                                    ],
                                  )
                                      ]
                                    ),
                                  )
                                ),
                              ),

                            );
                          }
                        ),
                      ],
                    ),
                  ), 
                ], 
              ),

      

      drawer: Drawer(
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


