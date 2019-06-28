import 'package:flutter/widgets.dart';
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

    bool saved = true;
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
                    image: NetworkImage(laptops.image != null ? laptops.image: "https://cdn0.centrecom.com.au/images/upload/0058832_0.jpeg"),
                   ),
                  ),
                  ), 
          ),
          
         Expanded( flex: 4,
         child:
          Container(
            padding: EdgeInsets.all(20),
            // TODO: Laptop description will overflow container if it is too long
            child: Center(child: Text(laptops.shortDescription, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15, letterSpacing: 1.0),),),
          )),

         Expanded( 
          flex: 2,
          child:Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

             
             IconButton(
              
              icon: Icon(saved ? Icons.favorite : Icons.favorite_border,
              color: saved? Colors.red: null,),
              onPressed: () {
                  saved ? saved = false: saved =  true;            
              },),
           

          MaterialButton(
            child: Text("Buy Now", style: TextStyle(fontSize: 16),),
            color: Colors.greenAccent,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
              ),
            elevation: 0.8,
            onPressed: () {
                             
              },
          )
            ],
          )),
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
