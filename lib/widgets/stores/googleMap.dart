import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(26.8206, 30.8025);
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
