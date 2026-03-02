import 'dart:math';

import 'package:coupon_code/app/core/values/app_assets.dart';
import 'package:coupon_code/app/data/models/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopMap extends StatelessWidget {
  final ShopModel shop;

  const ShopMap({super.key, required this.shop});

  Future<BitmapDescriptor> _loadShopIcon() async {
    return await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(50, 50)),
      AppAssets.shopMapMarker,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Check if there are any outlets
    if (shop.outlets == null || shop.outlets!.isEmpty) {
      return const Center(child: Text('No outlets available'));
    }

    return FutureBuilder<BitmapDescriptor>(
      future: _loadShopIcon(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          ); // Show loading while the icon is loading
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading icon'));
        }

        final shopIcon = snapshot.data;

        final Set<Marker> markers = {};

        // Variables to calculate LatLngBounds
        double minLat = 90.0;
        double maxLat = -90.0;
        double minLng = 180.0;
        double maxLng = -180.0;

        // Loop through all the outlets and add a marker for each
        for (var outlet in shop.outlets!) {
          final location = outlet.location;

          // Make sure the outlet has valid coordinates
          if (location?.coordinates != null) {
            final shopLocation = LatLng(location!.coordinates![1], location.coordinates![0]);

            // Update the bounds
            minLat = min(minLat, shopLocation.latitude);
            maxLat = max(maxLat, shopLocation.latitude);
            minLng = min(minLng, shopLocation.longitude);
            maxLng = max(maxLng, shopLocation.longitude);

            // Add the marker to the set of markers
            markers.add(
              Marker(
                markerId: MarkerId(outlet.sId ?? ''),
                position: shopLocation,
                icon: shopIcon!,
                infoWindow: InfoWindow(
                  title: shop.businessName,
                  snippet: outlet.address ?? 'No address available',
                ),
              ),
            );
          }
        }

        // Use the first outlet location to center the map
        final firstOutletLocation = shop.outlets?.first.location?.coordinates;
        if (firstOutletLocation == null) {
          return const Center(child: Text('No valid outlet coordinates'));
        }

        final initialPosition = LatLng(firstOutletLocation[1], firstOutletLocation[0]);

        return SizedBox(
          height: 300, // Adjust the size of the map
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: initialPosition,
              zoom: 14.0, // Adjust zoom level
            ),
            markers: markers, // Set the markers for the map
            onMapCreated: (GoogleMapController controller) {
              // You can customize map settings here if needed
            },
          ),
        );
      },
    );
  }
}
