import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  double longitude;
  double latitude;
  Maps(this.longitude, this.latitude);
  _MapsState createState() => _MapsState(this.longitude, this.latitude);
}

class _MapsState extends State<Maps> {
  static double longitude;
  static double latitude;
  _MapsState(longitude, latitude);

  GoogleMapController mapController;
  LatLng _center = LatLng(longitude, latitude);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            )));
  }
}
