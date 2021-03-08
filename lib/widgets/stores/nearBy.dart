import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wisefood/providers/stores.dart';
import 'package:geolocator/geolocator.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController mapController;
  var position;
  var loadedMaps;
  final Map<String, Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    loadedMaps = Provider.of<Stores>(
      context,
      listen: false,
    ).returnAll;

    mapController = controller;
    setState(() {
      _markers.clear();

      final marker = Marker(
        markerId: MarkerId(loadedMaps.storeTitle),
        position: LatLng(loadedMaps.latitude, loadedMaps.longitude),
        infoWindow: InfoWindow(
          title: loadedMaps.storeTitle,
          snippet: loadedMaps.location,
        ),
      );
      _markers[loadedMaps.storeTitle] = marker;
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
