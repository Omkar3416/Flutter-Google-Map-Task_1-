import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {

  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> markers = new Set(); //markers for google map
  static const LatLng showLocation = const LatLng(18.591304,73.817502);



  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(18.592044,73.817404),
    zoom: 14.4746,
  );

  static final CameraPosition _home = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(18.592044,73.817404),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        markers: getmarkers(),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToHome,
        label: Text('To the Home'),
        icon: Icon(Icons.directions_outlined),
      ),
    );
  }

  Future<void> _goToHome() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_home));
  }

  Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(18.598107,73.799101), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(18.605917,73.822421), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Marker Title Third ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(18.591613,73.734820), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Hinjawadi ',
          snippet: 'Phase 1',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(18.659083,73.777459), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Nigdi',
          snippet: 'Nigdi main road',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(18.500765,73.858440), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Swargate',
          snippet: 'Swargate main road',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(18.536574,73.880877), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Bund Garden',
          snippet: 'BundGarden main road',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(18.538384,73.795363), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Pashan',
          snippet: 'Dr. homi Bhaba Marg',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));


      //add more markers here
    });

    return markers;
  }
}
