import 'package:flutter/material.dart';
import 'package:marjam/model/item.dart';
import 'package:marjam/model/detail_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
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
  List items;
  @override
  void initState() {
    items = getitems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

    ListTile makeListTile(Item items) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.black))),
            child: Icon(Icons.shopping_basket, color: Colors.black),
          ),

          title: Text(
            items.title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    
                    child: Text(items.price.toString(),
                        style: TextStyle(color: Colors.green[50])),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(items.avail,
                        style: TextStyle(color: Colors.black))),
              )
            ],
          ),

          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DetailPage(items: items)));
          },
        );

    Card makeCard(Item items) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          
          child: Container(
            decoration: BoxDecoration(color: Colors.blue[300]),
            child: makeListTile(items),
            
          ),
          
        );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(items[index]);
        },
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.white,
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_basket),
          tooltip: "About Duck Buy",
          onPressed: () {},
        )
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
              icon: Icon(Icons.account_circle, color: Colors.black),
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
}


/*

TODO - Create APi Request from bestbuy

API Request URL

https://api.bestbuy.com/v1/products((categoryPath.id=abcat0502000))?apiKey=wgd9fp6cujtdn27wm9k8rtdg&sort=image.asc&show=image,inStoreAvailability,manufacturer,regularPrice,shortDescription,name&pageSize=5&format=json


FORMAT RETURNED

"products": [
    {
        "image": "https://img.bbystatic.com/BestBuy_US/images/products/4598/4598800_sa.jpg",
        "inStoreAvailability": true,
        "manufacturer": "Apple",
        "regularPrice": 1299.99,
        "shortDescription": "Intel Core m3 processor Intel HD Graphics 615Fast SSD storageUp to 10 hours of battery life&#178;802.11ac Wi-FiForce Touch Trackpad",
        "name": "Apple - MacBook® - 12\" Display - Intel Core M3 - 8GB Memory - 256GB Flash Storage (Latest Model) - Space Gray"
    }
    {
      ...
    }
  ]

*/
List getitems() {
  return [
    Item(
        title: "Razer Blade",
        avail: "In Stock",
        price: 2500,
        content:
            "I'm the best gaming laptop ever"),
    Item(
        title: "Lenovo X1",
        avail: "In Stock",
        price: 1500,
        content:
            "I'm the best productivity laptop"),
    Item(
        title: "MacBook",
        avail: "Out of stock",
        price: 5000,
        content:
            "lol i cost five grand"),
    Item(
        title: "XPS",
        avail: "Out of stock",
        price: 3000,
        content:
            "Dell's best creation"),
    Item(
        title: "Omen",
        avail: "In Stock",
        price: 3500,
        content:
            "I used to be the sh*t"),
    Item(
        title: "Alien Ware",
        avail: "In Stock",
        price: 2500,
        content:
            "Heavy asf"),
  ];
}

