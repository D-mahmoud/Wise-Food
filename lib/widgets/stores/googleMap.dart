import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisefood/models/map.dart';
import 'package:wisefood/providers/auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wisefood/providers/stores.dart';

class Maps extends StatefulWidget {
  final String storeid;
  Maps(this.storeid);
  _MapsState createState() => _MapsState(storeid);
}

class _MapsState extends State<Maps> {
  GoogleMapController mapController;
  final String storeid;
  _MapsState(this.storeid);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget build(BuildContext context) {
    final loadedMaps = Provider.of<Stores>(
      context,
      listen: false,
    ).findById(storeid);
    final LatLng _center = LatLng(loadedMaps.latitude, loadedMaps.longitude);
    final authData = Provider.of<Auth>(context, listen: false);
    return Scaffold(
        body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            )));
  }
}
