import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wisefood/providers/stores.dart';

class Maps extends StatefulWidget {
  Maps(this.storeid);
  final String storeid;

  @override
  _MapsState createState() => _MapsState(storeid);
}

class _MapsState extends State<Maps> {
  _MapsState(this.storeid);
  GoogleMapController mapController;
  final String storeid;

  final Map<String, Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    final loadedMaps = Provider.of<Stores>(
      context,
      listen: false,
    ).findById(storeid);
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
    final loadedMaps = Provider.of<Stores>(
      context,
      listen: false,
    ).findById(storeid);
    final _center = LatLng(loadedMaps.latitude, loadedMaps.longitude);
    return Scaffold(
        body: GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
      markers: _markers.values.toSet(),
    ));
  }
}
