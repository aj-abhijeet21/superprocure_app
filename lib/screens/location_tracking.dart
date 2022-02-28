import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:superprocure_app/services/input.dart';
import 'package:superprocure_app/model/directions_model.dart';
import 'package:superprocure_app/services/google_map_api.dart';

class LocationTracking extends StatefulWidget {
  const LocationTracking({Key? key}) : super(key: key);

  @override
  _LocationTrackingState createState() => _LocationTrackingState();
}

class _LocationTrackingState extends State<LocationTracking> {
  bool isLoading = false;
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _marker = Set<Marker>();

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinesPoints;
  List<LocalDirections> list = [];

  // late StreamSubscription<LocationData> subscription;
  late StreamSubscription<LocalDirections> subscription;
  late LocationData currentLocation;
  late LocationData sourceLocation;
  late LocationData destinationLocation;
  late Location location;

  Stream<LocalDirections> getLocation(List<LocalDirections> list) async* {
    int i = 0;
    while (i < list.length) {
      if (i > 1 && i + 1 < list.length) {
        Duration duration = list[i + 1].duration.difference(list[i].duration);
        // print('Current Duration: ${duration.inSeconds}');
        await Future.delayed(
          Duration(seconds: duration.inSeconds),
        );
      }
      yield list[i];
      i++;
    }
  }

  void setLatLng() {
    var jsonData = json.decode(localResponse);
    jsonData.forEach(
      (element) {
        list.add(LocalDirections.fromJson(element));
      },
    );
  }

  @override
  void initState() {
    super.initState();

    location = Location();
    polylinesPoints = PolylinePoints();
    setLatLng();
    setInitialLocation();
  }

  void setInitialLocation() async {
    currentLocation = LocationData.fromMap({
      'latitude': list[0].lat,
      'longitude': list[0].lng,
    });
    sourceLocation = LocationData.fromMap({
      'latitude': list[0].lat,
      'longitude': list[0].lng,
    });
    destinationLocation = LocationData.fromMap({
      'latitude': list[list.length - 1].lat,
      'longitude': list[list.length - 1].lng,
    });
  }

  Future<void> showLocationPins() async {
    var sourcePosition = LatLng(
      currentLocation.latitude ?? 0.0,
      currentLocation.longitude ?? 0.0,
    );

    var destinationPosition = LatLng(
      destinationLocation.latitude ?? 0.0,
      destinationLocation.longitude ?? 0.0,
    );

    var icon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(40, 40),
      ),
      'assets/icons/truck.png',
    );

    _marker.add(
      Marker(
        markerId: const MarkerId('sourcePosition'),
        position: sourcePosition,
        icon: icon,
      ),
    );

    _marker.add(
      Marker(
        markerId: const MarkerId('destinationPosition'),
        position: destinationPosition,
        // icon: BitmapDescriptor.defaultMarker,
      ),
    );

    setPolylineInMap();
  }

  void setPolylineInMap() async {
    var result = await polylinesPoints.getRouteBetweenCoordinates(
      GoogleMapApi().url,
      PointLatLng(
        currentLocation.latitude ?? 0.0,
        currentLocation.longitude ?? 0.0,
      ),
      PointLatLng(
        destinationLocation.latitude ?? 0.0,
        destinationLocation.longitude ?? 0.0,
      ),
    );
    // print(result);
    if (result.points.isNotEmpty) {
      result.points.forEach((pointLatLng) {
        polylineCoordinates.add(
          LatLng(pointLatLng.latitude, pointLatLng.longitude),
        );
      });
    }

    setState(() {
      _polylines.add(
        Polyline(
          width: 5,
          visible: true,
          polylineId: const PolylineId('polyline'),
          color: Colors.red,
          points: polylineCoordinates,
        ),
      );
    });
  }

  void updatePinsOnMap() async {
    CameraPosition cameraPosition = CameraPosition(
      zoom: 15,
      tilt: 50,
      bearing: 30,
      target: LatLng(
        currentLocation.latitude!,
        currentLocation.longitude!,
      ),
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    var sourcePosition = LatLng(
      currentLocation.latitude ?? 0.0,
      currentLocation.longitude ?? 0.0,
    );
    var icon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(40, 40),
      ),
      'assets/icons/truck.png',
    );
    setState(() {
      _marker.removeWhere(
        (marker) => marker.mapsId.value == 'sourcePosition',
      );

      _marker.add(
        Marker(
          markerId: const MarkerId('sourcePosition'),
          position: sourcePosition,
          icon: icon,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 20,
      tilt: 50,
      bearing: 30,
      target: LatLng(sourceLocation.latitude!, sourceLocation.longitude!),
    );
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          markers: _marker,
          polylines: _polylines,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            showLocationPins();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            subscription = getLocation(list).listen(
              (clocation) {
                currentLocation = LocationData.fromMap(
                  {
                    'latitude': clocation.lat,
                    'longitude': clocation.lng,
                  },
                );
                // print('CurrentLocation: $currentLocation');
                updatePinsOnMap();
              },
            );
          },
          child: const Icon(
            Icons.navigation_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
