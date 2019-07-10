import 'package:flutter/widgets.dart';
import 'package:marjam/model/laptop.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatelessWidget {
  GoogleMapController mapController;
  final Laptop laptops;
  MapsPage({Key key, this.laptops}) : super(key: key);
  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    final topAppBar = AppBar(
      leading: new IconButton(
        icon: new Icon(Icons.arrow_back, color: Colors.orange[300]),
        onPressed: () => Navigator.of(context).pop(),
      ),
      elevation: 0.1,
      backgroundColor: Colors.white,
      title: Text("Store Locator"),
    );

    return Scaffold(
      appBar: topAppBar,
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        rotateGesturesEnabled: true,
        myLocationEnabled: true,
        compassEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
