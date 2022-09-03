import 'package:geolocator/geolocator.dart';

/// Service that encapsulates all Location related logic.
class LocationService {
  Future<Location> getCurrentLocation() async {
    checkLocationPermission();
    Position position = await Geolocator.getCurrentPosition();
    Location location =
        Location(latitude: position.latitude, longitude: position.longitude);
    print('Obtained current location: $location');
    return location;
  }

  void checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied.',
      );
    }
  }
}

/// Model that represents user location data.
class Location {
  double latitude;
  double longitude;

  Location({required this.latitude, required this.longitude});

  @override
  String toString() {
    return 'Location[latitude=$latitude, longitude=$longitude]';
  }
}
