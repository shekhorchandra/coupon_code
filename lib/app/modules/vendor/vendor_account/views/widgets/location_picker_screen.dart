import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

class LocationPickerScreen extends StatefulWidget {
  @override
  _LocationPickerScreenState createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  GoogleMapController? mapController;
  LatLng selectedLocation = LatLng(37.4219999, -122.0840575);
  Set<Marker> markers = {};
  TextEditingController addressController = TextEditingController();

  final String googleApiKey = "YOUR_API_KEY";

  @override
  void initState() {
    super.initState();
    _setMarker(selectedLocation);
  }

  void _setMarker(LatLng position) {
    setState(() {
      markers = {Marker(markerId: MarkerId("selected-location"), position: position)};
    });
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    Placemark place = placemarks.first;

    addressController.text = "${place.street}, ${place.locality}, ${place.country}";
  }

  Future<void> _getLatLngFromAddress(String address) async {
    List<dynamic> locations = await locationFromAddress(address);
    Location location = locations.first;

    LatLng newPosition = LatLng(location.latitude, location.longitude);

    mapController?.animateCamera(CameraUpdate.newLatLngZoom(newPosition, 15));

    _setMarker(newPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Location Picker")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GooglePlaceAutoCompleteTextField(
              textEditingController: addressController,
              googleAPIKey: googleApiKey,
              inputDecoration: InputDecoration(
                hintText: "Search location",
                border: OutlineInputBorder(),
              ),
              debounceTime: 800,
              isLatLngRequired: true,
              getPlaceDetailWithLatLng: (prediction) {
                double lat = double.parse(prediction.lat!);
                double lng = double.parse(prediction.lng!);

                LatLng newPosition = LatLng(lat, lng);

                mapController?.animateCamera(CameraUpdate.newLatLngZoom(newPosition, 15));

                _setMarker(newPosition);
              },
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: selectedLocation, zoom: 14),
              onMapCreated: (controller) {
                mapController = controller;
              },
              markers: markers,
              onTap: (LatLng position) async {
                _setMarker(position);
                await _getAddressFromLatLng(position);
              },
            ),
          ),
        ],
      ),
    );
  }
}
