import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:testing/constants/app_sizes.dart';
import 'package:testing/controllers/contact_us_crl/contact_us_crl.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Get.find<ConatactUsCrl>().getLocation(googleMapController),
      builder: (context, snapshot) {
        return GetBuilder<ConatactUsCrl>(
          builder: (mapCrl) {
            return Scaffold(
              body: SizedBox(
                height: Sizes.height(context) - Sizes.statusBarHeight(context),
                width: Sizes.width(context),
                child: GoogleMap(
                  myLocationButtonEnabled: true,
                  markers: mapCrl.markers,
                  mapToolbarEnabled: true,
                  myLocationEnabled: true,
                  compassEnabled: true,
                  mapType: MapType.normal,
                  onTap: (LatLng latLng) {
                    mapCrl.selectLatLngOnMap(latLng);
                    
                  },
                  zoomControlsEnabled: true,
                  initialCameraPosition: mapCrl.initCameraPosition(),
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController.complete(controller);
                 
                  },
                ),
              ),
            );
          },
        );
      }
    );
  }
}
