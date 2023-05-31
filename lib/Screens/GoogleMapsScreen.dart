import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  GoogleMapController? mapController;

  final LatLng location1 = LatLng(40.7128, -74.0060); // Replace with your actual latitude and longitude
  final LatLng location2 = LatLng(51.5074, -0.1278);  // Replace with your actual latitude and longitude
  final LatLng location3 = LatLng(34.0522, -118.2437);  // Replace with your actual latitude and longitude

  Set<Marker> markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId('location1'),
          position: location1,
        ),
      );
      markers.add(
        Marker(
          markerId: MarkerId('location2'),
          position: location2,
        ),
      );
      markers.add(
        Marker(
          markerId: MarkerId('location3'),
          position: location3,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: location1,
        zoom: 10,
      ),
      markers: markers,
    );
  }
}