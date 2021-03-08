import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisefood/models/map.dart';
import 'package:wisefood/providers/auth.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget build(BuildContext context) {
    final map = Provider.of<GMap>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    final LatLng _center = LatLng(map.latitude, map.longitude);
    return Scaffold(
        body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            )));
  }
}
