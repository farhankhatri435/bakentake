// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/places.dart';

// class Repository {

//   void getlocationDetails(String code, String apiType) {}

//   final GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: "AIzaSyADx7e9LEaggUjkWhEhHyxJDeMR1ElR1wk");
//   Future<PlacesAutocompleteResponse> getAutocompleteResponse(String search) async{
//     return await places.autocomplete(search,sessionToken: "6173762");
//   }

//   Future<LatLng> getLatLngfromAddress(String description) async{
//     List<Placemark> list = await Geolocator().placemarkFromAddress(description);
//     return LatLng(list[0].position.latitude, list[0].position.longitude);
//   }

// }

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geocoding/geocoding.dart' as abc;
import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';

class Repository {
  void getlocationDetails(String code, String apiType) {}

  final GoogleMapsPlaces places =
      GoogleMapsPlaces(apiKey: "AIzaSyADx7e9LEaggUjkWhEhHyxJDeMR1ElR1wk");
  Future<PlacesAutocompleteResponse> getAutocompleteResponse(
      String search) async {
    return await places.autocomplete(search, sessionToken: "6173762");
  }

  Future<LatLng> getLatLngfromAddress(String description) async {
    List<abc.Location> list = await abc.locationFromAddress(description);
    return LatLng(list[0].latitude, list[0].longitude);
  }
}
