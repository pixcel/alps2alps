import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Map-specific config constants
class MapConstants {
  static const minimumRequestInterval = Duration(milliseconds: 1100);

  static const defaultGeocodingResultTypesList = [
    'street_address',
    'premise',
    'subpremise',
  ];

  static const defaultMapPosition = CameraPosition(
    //Center of Warsaw (default location may be shifted a bit after UI layout building on bigger screens)
    target: LatLng(52.2319, 21.0067),
    zoom: 12.0,
  );

  static const mapStyle = '''
    [
     {
       "featureType": "all",
       "elementType": "geometry",
       "stylers": [{"color": "#e0e0e0"}]
     },
     {
       "featureType": "road",
       "elementType": "geometry",
       "stylers": [{"color": "#ffffff"}]
     },
     {
       "featureType": "road",
       "elementType": "geometry.stroke",
       "stylers": [{"color": "#e0e0e0"}]
     },
     {
       "featureType": "road.highway",
       "elementType": "geometry",
       "stylers": [{"color": "#dadada"}]
     },
     {
       "featureType": "road.arterial",
       "elementType": "geometry",
       "stylers": [{"color": "#ffffff"}]
     },
     {
       "featureType": "road.local",
       "elementType": "geometry",
       "stylers": [{"color": "#ffffff"}]
     },
     {
       "featureType": "transit",
       "elementType": "geometry",
       "stylers": [{"color": "#d4d4d4"}]
     },
     {
       "featureType": "landscape.man_made.building",
       "elementType": "geometry.fill",
       "stylers": [{"color": "#c7c7c7"}]
     },
     {
       "featureType": "water",
       "elementType": "all",
       "stylers": [{"color": "#e6f2f7"}]
     },
     {
       "featureType": "administrative.locality",
       "elementType": "labels",
       "stylers": [
         {"visibility": "on"},
         {"weight": 2}
       ]
     },
     {
       "featureType": "administrative.locality",
       "elementType": "labels.text",
       "stylers": [
         {"weight": 2}
       ]
     },
     {
       "featureType": "all",
       "elementType": "labels.text.fill",
       "stylers": [{"color": "#616161"}]
     },
     {
       "featureType": "all",
       "elementType": "labels.text.stroke",
       "stylers": [{"color": "#f5f5f5"}]
     },
     {
       "featureType": "poi",
       "stylers": [{"visibility": "off"}]
     },
     {
       "featureType": "road",
       "elementType": "labels.icon",
       "stylers": [{"visibility": "off"}]
     }
    ]
  ''';
}
