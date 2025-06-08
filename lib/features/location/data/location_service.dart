import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'location_model.dart';

class LocationService {
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<LocationPermissionStatus> checkPermissions() async {
    bool serviceEnabled = await isLocationServiceEnabled();
    if (!serviceEnabled) {
      return LocationPermissionStatus.serviceDisabled;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    switch (permission) {
      case LocationPermission.denied:
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return LocationPermissionStatus.denied;
        }
        if (permission == LocationPermission.deniedForever) {
          return LocationPermissionStatus.deniedForever;
        }
        return LocationPermissionStatus.granted;
      case LocationPermission.deniedForever:
        return LocationPermissionStatus.deniedForever;
      case LocationPermission.whileInUse:
      case LocationPermission.always:
        return LocationPermissionStatus.granted;
      default:
        return LocationPermissionStatus.denied;
    }
  }

  Future<String?> getLocationName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        // Try to build a meaningful location name
        String locationName = '';

        if (place.name != null && place.name!.isNotEmpty) {
          locationName = place.name!;
        } else if (place.street != null && place.street!.isNotEmpty) {
          locationName = place.street!;
        } else if (place.subLocality != null && place.subLocality!.isNotEmpty) {
          locationName = place.subLocality!;
        } else if (place.locality != null && place.locality!.isNotEmpty) {
          locationName = place.locality!;
        }

        return locationName.isNotEmpty ? locationName : null;
      }
    } catch (e) {
      debugPrint('Error getting location name: $e');
    }
    return null;
  }

  Future<Map<String, String?>> getDetailedAddress(
    double latitude,
    double longitude,
  ) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        // Build detailed address components
        List<String> addressParts = [];

        // Add street address if available
        if (place.street != null && place.street!.isNotEmpty) {
          addressParts.add(place.street!);
        }

        // Add sublocality (neighborhood/district) if available
        if (place.subLocality != null && place.subLocality!.isNotEmpty) {
          addressParts.add(place.subLocality!);
        }

        // Add locality (city) if available
        if (place.locality != null && place.locality!.isNotEmpty) {
          addressParts.add(place.locality!);
        }

        // Add administrative area (state/province) if available
        if (place.administrativeArea != null &&
            place.administrativeArea!.isNotEmpty) {
          addressParts.add(place.administrativeArea!);
        }

        // Add country if available
        if (place.country != null && place.country!.isNotEmpty) {
          addressParts.add(place.country!);
        }

        String fullAddress = addressParts.join(', ');

        return {
          'locationName':
              place.name?.isNotEmpty == true ? place.name : place.street,
          'address': fullAddress.isNotEmpty ? fullAddress : null,
          'city': place.locality,
          'country': place.country,
          'postalCode': place.postalCode,
          'administrativeArea': place.administrativeArea,
          'subAdministrativeArea': place.subAdministrativeArea,
        };
      }
    } catch (e) {
      debugPrint('Error getting detailed address: $e');
    }
    return {};
  }

  Future<LocationData> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 10),
      ),
    );

    // Get address details
    Map<String, String?> addressDetails = await getDetailedAddress(
      position.latitude,
      position.longitude,
    );

    return LocationData.fromPosition(
      position,
      locationName: addressDetails['locationName'],
      address: addressDetails['address'],
      city: addressDetails['city'],
      country: addressDetails['country'],
    );
  }

  Future<LocationData?> getLastKnownLocation() async {
    Position? position = await Geolocator.getLastKnownPosition();
    if (position != null) {
      // Get address details
      Map<String, String?> addressDetails = await getDetailedAddress(
        position.latitude,
        position.longitude,
      );

      return LocationData.fromPosition(
        position,
        locationName: addressDetails['locationName'],
        address: addressDetails['address'],
        city: addressDetails['city'],
        country: addressDetails['country'],
      );
    }
    return null;
  }

  Stream<LocationData> getLocationStream() {
    return Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).asyncMap((position) async {
      // Get address details for each position update
      Map<String, String?> addressDetails = await getDetailedAddress(
        position.latitude,
        position.longitude,
      );

      return LocationData.fromPosition(
        position,
        locationName: addressDetails['locationName'],
        address: addressDetails['address'],
        city: addressDetails['city'],
        country: addressDetails['country'],
      );
    });
  }

  Future<double> getDistanceBetween(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) async {
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }

  // Method to search for places by name
  Future<List<Location>> searchLocationsByName(String locationName) async {
    try {
      List<Location> locations = await locationFromAddress(
        locationName.toLowerCase().trim(),
      );
      return locations;
    } catch (e) {
      debugPrint('Error searching locations: $e');
      return [];
    }
  }
}
