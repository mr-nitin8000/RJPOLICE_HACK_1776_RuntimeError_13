import 'package:location/location.dart' as Loc;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';


class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  late GoogleMapController googleMapController;
  double? lati = 23.1827;
  double? long = 75.7682;
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(23.1827, 75.7682),
    zoom: 14.4746,
  );
  Set<Marker> markers = {};

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location are denied permanently");
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  Loc.LocationData? locationData;
  bool isLoading = false;
  List<Placemark>? placemark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Current Location"),
      //   centerTitle: true,
      //   backgroundColor: Color(0xFFDE95FC),
      // ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              10.0), // Adjust the radii values as needed
        ),
        backgroundColor: Color(0xFFDE95FC),
        onPressed: () async {
          // loading circle
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0xF58A1DC7),
                    color: Colors.purpleAccent,
                    semanticsLabel: "Loading",
                    strokeWidth: 3,
                  ));
            },
          );

          Position position = await _determinePosition();
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14,
              ),
            ),
          );

          print(position);
          // var snackBar = SnackBar(
          //     content: Text('$position'),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);

          markers.clear();
          markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude)));
          setState(() {});
          // getPermisiion();
          // getLocation();

          Navigator.of(context).pop();
          if (position != null) {
            locationData = await Loc.Location.instance.getLocation();
            placemark = await placemarkFromCoordinates(
                locationData!.latitude!, locationData!.longitude!);
            print(placemark![0]);
            var snackBar = SnackBar(
              shape: StadiumBorder(),
              duration: Duration(seconds: 3),
              backgroundColor: Color(0xFFDE95FC),
              padding: EdgeInsets.all(20),
              content: Text(
                  'Location: ${placemark![0].name} ${placemark![0].street} ${placemark![0].postalCode} ${placemark![0].country} ${placemark![0].locality}'),
              // behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            // bottom sheet
            // await showModalBottomSheet(context: context, builder: (BuildContext context)
            // {
            //   return Padding(padding: EdgeInsets.only(top:20,left:20,right:20,
            //       bottom:MediaQuery.of(context).viewInsets.bottom),
            //     child:Column(
            //       mainAxisSize: MainAxisSize.min,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         SizedBox(height:30),
            //         Text("Address:"),
            //         SizedBox(height:30),
            //         Text("${placemark![0]}"),
            //         SizedBox(height:30),
            //       ],
            //     ),
            //   );
            // });
            //   bottom sheet endd
          }
        },
        child: Icon(Icons.my_location,
          color: Colors.black,
        ),
      ),
    );
  }
}
