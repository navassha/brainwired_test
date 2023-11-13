import 'dart:async';

import 'package:brain_wired_mechine_test/Widgets/styled_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MAPViewOFuser extends StatelessWidget {
  MAPViewOFuser(
      {super.key, required this.lat, required this.lang, required this.name});

  final String lat;
  final String lang;
  final String name;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    final double lt = double.parse(lat);
    final double ln = double.parse(lang);

    CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(lt, ln),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);

    return Scaffold(
      appBar: AppBar(
        title: StyledText(text: name, size: 18),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.back,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kLake,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
