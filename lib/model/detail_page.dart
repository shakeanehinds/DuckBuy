import 'package:marjam/model/laptop.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
 
  final Laptop laptops;
  DetailPage({Key key, this.laptops}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   
    
     final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.white,
      
      title: Text("Duck Buy"),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.shopping_basket),
          tooltip: "About Duck Buy",
          onPressed: () {},
        ),
       
      ],
    );

    final makeBody = Container(
    
      child: Column(
        
        children: <Widget>[
          
          Expanded(
            flex: 8,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(laptops.image),
                   ),
                  ),
                  ), 
          ),
          
         Expanded( flex: 6,
         child:
          Container(
            padding: EdgeInsets.all(20),
            
            child: Center(child: Text(laptops.shortDescription, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15, letterSpacing: 1.0),),),
          ))
        ],
      ),
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.mic_none, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.black),
              onPressed: () {},
            ),
            
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: topAppBar,
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }
}
