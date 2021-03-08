import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wisefood/providers/stores.dart';

class Maps2 extends StatefulWidget {
  @override
  _Maps2State createState() => _Maps2State();
}

class _Maps2State extends State<Maps2> {
  GoogleMapController mapController;
  var loadedMaps;
  final Map<String, Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    loadedMaps = Provider.of<Stores>(
      context,
      listen: false,
    ).returnAll();

    mapController = controller;
    setState(() {
      _markers.clear();
      for (final s in loadedMaps) {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    loadedMaps = Provider.of<Stores>(
      context,
      listen: false,
    ).returnAll;

    return Scaffold(
        body: GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(30.03333, 31.23334),
        zoom: 7.0,
      ),
      markers: _markers.values.toSet(),
    ));
  }
}
