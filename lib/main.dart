import 'package:flutter/material.dart';
import 'package:marjam/model/detail_page.dart';
import 'package:marjam/model/api_data.dart';
import 'package:marjam/model/laptop.dart';
import 'dart:convert';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Duck Buy',
      theme: new ThemeData(primaryColor: Colors.white),
      home: new ListPage(title: 'Duck Buy'),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}



class _ListPageState extends State<ListPage> {
  
  
  var laptops = new List<Laptop>();

  _getLaptops(){
    API.getLaptops().then((response){
      setState(() {
       var resBody = json.decode(response.body); 
       Iterable list = resBody["products"];
       laptops = list.map((model) => Laptop.fromJson(model)).toList();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

    ListTile makeListTile(Laptop laptops) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.black))),
            //child: Icon(Icons.shopping_basket, color: Colors.black),
            child: Image.network(laptops.image, width: 70,)
          ),

          title: Padding(padding: EdgeInsets.all(4.0), child: Text(

            /* TODO: Use regex to extract proper product name and send to view*/
            //laptops.name.splitMapJoin(pattern),
            laptops.name.split(" ")[0],
            //"Laptop Name Here",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 1.0),
        
          ),),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  
                  flex: 2,
                  child: Container(
                    child: Text( "\$" + laptops.regularPrice.toString(),
                        style: TextStyle(color: Colors.lightGreen[900])),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(laptops.inStoreAvailability.toString() == 'true' ? 'In Stock': 'Out of stock',
                        style: TextStyle(color: Colors.black))),
              )
            ],
          ),

          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DetailPage(laptops: laptops)));
          },
        );

    Card makeCard(Laptop laptops) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: makeListTile(laptops),
            
            
          ),
          
        );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: laptops.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(laptops[index]);
        },
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.white,
      leading:  new IconButton(
        
          icon: new Image.asset('images/logo.png', fit: BoxFit.contain, height: 32,),
          onPressed: () {},
        ),
      title: Center(child: Text(widget.title)),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.account_circle),
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
                /*
                TODO : ADD Navigation
                  *************************** NOTE *************************************
                  This home button will not work with more than two items in stack, 
                  to achive a proper home function routes will need to be created 
                  and used in conjunction with the popuntil(context, predicate) function to 
                  take the user to a specific route, in this case the main page
                */
                Navigator.canPop(context);  
              },
            ),
            IconButton(
              icon: Icon(Icons.mic_none, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_basket, color: Colors.black),
              onPressed: () {},
            ),
            
          ],
        ),
      ),
    );
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topAppBar,
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }

  @override
  void initState() {
    super.initState();
    _getLaptops();
    
  }
}

