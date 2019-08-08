import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class VoicePage extends StatelessWidget {
  
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      
      elevation: 0.1,
      backgroundColor: Colors.white,
      title: Center(child:Text("Voice Search")),
    );

    bool saved = true;
    final makeBody = Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Container(
              margin: EdgeInsets.all(80),
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage("https://image.flaticon.com/icons/png/512/1458/1458584.png"),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.all(50),
                child: Center(
                  child: Text(
                    "Tap the mic and try saying 'Show me MacBooks'",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        letterSpacing: 1.0),
                        textAlign: TextAlign.center,
                  ),
                ),
              )),
          
        ],
      ),
    );

    return Scaffold(
      appBar: topAppBar,
      body: makeBody,
    );
  }
}
