import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  static double longitude;
  static double latitude;
  Maps(longitude, latitude);
  LatLng center = LatLng(longitude, latitude);
  _MapsState createState() => _MapsState(center);
}

class _MapsState extends State<Maps> {
  static LatLng center;

  _MapsState(center);

  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: center,
              zoom: 11.0,
            )));
  }
}
