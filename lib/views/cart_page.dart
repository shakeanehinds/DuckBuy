import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      
      elevation: 0.1,
      backgroundColor: Colors.white,
      title: Center(child:Text("Your Cart")),
    );

    
    final makeBody = Container(
      child: Column(
        children: <Widget>[

          Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text("This page is under construction",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        letterSpacing: 1.0),
                  ),
                ),
              )),
          Expanded(
            flex: 8,
            child: Container(
              margin: EdgeInsets.all(80),
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage("https://image.flaticon.com/icons/png/512/576/576997.png"),
                ),
              ),
            ),
          ),  
        ],
      ),
    );

    return Scaffold(
      appBar: topAppBar,
      body: makeBody,
    );
  }
}
