import 'package:flutter/widgets.dart';
import 'package:marjam/model/laptop.dart';
import 'package:flutter/material.dart';
import 'package:marjam/views/map_page.dart';

class DetailPage extends StatelessWidget {
  final Laptop laptops;
  DetailPage({Key key, this.laptops}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      leading: new IconButton(
        icon: new Icon(Icons.arrow_back, color: Colors.orange[300]),
        onPressed: () => Navigator.of(context).pop(),
      ),
      elevation: 0.1,
      backgroundColor: Colors.white,
      title: Text(laptops.name),
    );

    bool saved = true;
    final makeBody = Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.all(50),
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(laptops.image != null
                      ? laptops.image
                      : "https://www.modvellumclinical.com/wp-content/uploads/no-product-image.png"),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(20),
                // TODO: Laptop description will overflow container if it is too long
                child: Center(
                  child: Text(
                    laptops.shortDescription != null
                        ? laptops.shortDescription
                        : "No Description available",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        letterSpacing: 1.0),
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      saved ? Icons.favorite : Icons.favorite_border,
                      color: saved ? Colors.red : null,
                    ),
                    onPressed: () {
                      saved ? saved = false : saved = true;
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.location_on, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MapsPage(laptops: laptops)));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
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
