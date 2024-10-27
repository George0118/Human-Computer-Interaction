import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:my_app/core/app_export.dart';
import 'dart:async';
import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';

class MyMap extends StatefulWidget {
  final Widget title;
  final double zoom;
  final Set<Marker> markers;

  const MyMap({required this.title, required this.zoom, required this.markers, Key? key}) :  super(key: key);

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  Widget _body = Center(child: Text("Loading"));

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  final Completer<GoogleMapController> _controller = Completer();
  LocationData? currentLocation;

  @override
  void initState() {
    log("I am in initState");
    _ShowMyMap(widget.title, widget.zoom, widget.markers);
    super.initState();
  }

  Widget? _ShowMyMap(Widget title, double zoom, Set<Marker> _markers) {
    Location location = Location();
    log("I am getting current location");
    location.getLocation().then((location) {
      log("I am going to give current location a value $location.getLocation()");
      currentLocation = location;
      if (currentLocation == null) {
        log("i just gave current location a value and still location is null");
      } else {
        log("location is not supposed to be null anymore");
      }
      log("i am going to shop map");
      MaterialApp Map = MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: title,
            backgroundColor: ColorConstant.green900,
          ),
          body: GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    currentLocation!.latitude!, currentLocation!.longitude!),
                zoom: zoom,
              ),
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                new Factory<OneSequenceGestureRecognizer>(
                  () => new EagerGestureRecognizer(),
                ),
              ].toSet(),
              markers: _markers,
              ),
        ),
      );
      setState(() => _body = Map);
    });
  }
}

