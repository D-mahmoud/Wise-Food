import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wisefood/providers/stores.dart';
import 'package:geolocator/geolocator.dart';

class Maps2 extends StatefulWidget {
  @override
  _Maps2State createState() => _Maps2State();
}

class _Maps2State extends State<Maps2> {
  GoogleMapController mapController;
  var position;
  var loadedMaps;
  var radius = 2500;
  final Map<String, Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    loadedMaps = Provider.of<Stores>(
      context,
      listen: false,
    ).returnAll;

    mapController = controller;
    setState(() {
      _markers.clear();
      for (final s in loadedMaps) {
        var p = LatLng(s.latitude, s.longitude);
        if (position - p <= radius) {
          final marker = Marker(
            markerId: MarkerId(s.storeTitle),
            position: LatLng(s.latitude, s.longitude),
            infoWindow: InfoWindow(
              title: s.storeTitle,
              snippet: s.location,
            ),
          );
          _markers[s.storeTitle] = marker;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    loadedMaps = Provider.of<Stores>(
      context,
      listen: false,
    ).returnAll;
    getloc() async {
      position = await Geolocator().getLastKnownPosition();
    }

    return Scaffold(
        body: GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: position,
        zoom: 11.0,
      ),
      markers: _markers.values.toSet(),
    ));
  }
}
