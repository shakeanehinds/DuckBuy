import 'package:flutter/material.dart';
import 'package:marjam/views/products.dart' as home;
import 'package:marjam/views/voice_page.dart' as voice;
import 'package:marjam/views/cart_page.dart' as cart;
import 'package:flutter/services.dart';


void main() {
  runApp(new MaterialApp(
    title: 'Duck Buy',
      theme: new ThemeData(
        primaryColor: Colors.white,
        fontFamily: "Montserrat",
      ),
      debugShowCheckedModeBanner: false,
    home: new MyTabs()
  ));
}

class MyTabs extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(255, 198, 33, 1),
          statusBarIconBrightness: Brightness.light),
          
    );

    return new MyTabPages(title: 'Duck Buys');
   
  }
}
class MyTabPages extends StatefulWidget{
  MyTabPages({Key key, this.title}) : super(key: key);

  final String title;
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabPages> with SingleTickerProviderStateMixin{
  
  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose(){
    //controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      
      bottomNavigationBar: new Material(
        color: Colors.white,
        
        child: new TabBar(
          
          controller: controller,
          indicatorColor: Colors.white,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.home, color: controller.index == 1? Colors.orange[300]: Colors.black)),
            new Tab(icon: new Icon(Icons.mic, color: controller.index == 2? Colors.orange[300]: Colors.black)),
            new Tab(icon: new Icon(Icons.shopping_basket, color: controller.index == 3? Colors.orange[300]: Colors.black))
          ]
        )
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new home.ListPage(),
          new voice.VoicePage(),
          new cart.CartPage(),
        ]
      )
    );
  }
}

