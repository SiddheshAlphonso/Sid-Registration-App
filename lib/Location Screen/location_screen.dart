import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? _mapController;
  LatLng _initialLocation = LatLng(20.5937, 78.9629); // Centered at India
  LatLng? _searchedLocation;
  final TextEditingController _searchController = TextEditingController();

  // Function to search for location by name
  Future<void> _searchLocation() async {
    String address = _searchController.text;
    if (address.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(address);
        if (locations.isNotEmpty) {
          final location = locations.first;
          setState(() {
            _searchedLocation = LatLng(location.latitude, location.longitude);
            _mapController?.animateCamera(
              CameraUpdate.newLatLngZoom(_searchedLocation!, 14.0),
            );
          });
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location not found')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Location')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter Location',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchLocation,
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _initialLocation,
                zoom: 5.0,
              ),
              markers: _searchedLocation != null
                  ? {
                      Marker(
                        markerId: MarkerId('searchedLocation'),
                        position: _searchedLocation!,
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueRed),
                      ),
                    }
                  : {},
            ),
          ),
        ],
      ),
    );
  }
}
