import 'package:marjam/model/item.dart';
import 'package:marjam/model/laptop.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  //final Item items;
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
      body: Center(child: Text(
           laptops.name + " Costs \$" + laptops.regularPrice.toString() + " the descriptions says '" + laptops.shortDescription + "'"),),
      bottomNavigationBar: makeBottom,
    );
  }
}
