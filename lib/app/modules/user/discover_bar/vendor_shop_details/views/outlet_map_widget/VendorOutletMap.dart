/// For showing all outlets
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../../../../../../core/values/app_assets.dart';
// import '../../model/Vendor_deals_Shop_Model.dart';
//
//
// class VendorOutletMap extends StatefulWidget {
//   final List<OutletModel> outlets;
//   final OutletModel? selectedOutlet;
//
//   const VendorOutletMap({
//     super.key,
//     required this.outlets,
//     required this.selectedOutlet,
//   });
//
//   @override
//   State<VendorOutletMap> createState() => _VendorOutletMapState();
// }
//
// class _VendorOutletMapState extends State<VendorOutletMap> {
//   GoogleMapController? mapController;
//   BitmapDescriptor? shopIcon;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadIcon();
//   }
//
//   Future<void> _loadIcon() async {
//     shopIcon = await BitmapDescriptor.asset(
//       const ImageConfiguration(size: Size(50, 50)),
//       AppAssets.shopMapMarker,
//     );
//     setState(() {});
//   }
//
//   Set<Marker> _buildMarkers() {
//     return widget.outlets.map((outlet) {
//       return Marker(
//         markerId: MarkerId(outlet.id),
//         position: LatLng(outlet.lat, outlet.lng),
//         icon: shopIcon ?? BitmapDescriptor.defaultMarker,
//         infoWindow: InfoWindow(
//           title: outlet.name,
//           snippet: outlet.address,
//         ),
//       );
//     }).toSet();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (widget.outlets.isEmpty) {
//       return const Center(child: Text("No outlet locations"));
//     }
//
//     if (shopIcon == null) {
//       return const Center(child: CircularProgressIndicator());
//     }
//
//     final outlet = widget.selectedOutlet ?? widget.outlets.first;
//
//     return SizedBox(
//       height: 300,
//       child: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: LatLng(outlet.lat, outlet.lng),
//           zoom: 14,
//         ),
//         markers: _buildMarkers(),
//         onMapCreated: (controller) {
//           mapController = controller;
//         },
//       ),
//     );
//   }
// }


/// for selected outlets
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../core/values/app_assets.dart';
import '../../model/Vendor_deals_Shop_Model.dart';


class VendorOutletMap extends StatefulWidget {
  final OutletModel? selectedOutlet;

  const VendorOutletMap({
    super.key,
    required this.selectedOutlet,
  });

  @override
  State<VendorOutletMap> createState() => _VendorOutletMapState();
}

class _VendorOutletMapState extends State<VendorOutletMap> {
  GoogleMapController? mapController;
  BitmapDescriptor? shopIcon;

  @override
  void initState() {
    super.initState();
    _loadIcon();
  }

  Future<void> _loadIcon() async {
    shopIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(50, 50)),
      AppAssets.shopMapMarker,
    );
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant VendorOutletMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Move camera when outlet changes
    if (widget.selectedOutlet != null && mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(widget.selectedOutlet!.lat, widget.selectedOutlet!.lng),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selectedOutlet == null) {
      return const Center(child: Text("Select an outlet"));
    }

    if (shopIcon == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final outlet = widget.selectedOutlet!;

    final marker = Marker(
      markerId: MarkerId(outlet.id),
      position: LatLng(outlet.lat, outlet.lng),
      icon: shopIcon ?? BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: outlet.name,
        snippet: outlet.address,
      ),
    );

    return SizedBox(
      height: 300,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(outlet.lat, outlet.lng),
          zoom: 15,
        ),
        markers: {marker},
        onMapCreated: (controller) {
          mapController = controller;
        },
      ),
    );
  }
}