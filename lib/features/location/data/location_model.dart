import 'package:geolocator/geolocator.dart';

class LocationData {
  final double latitude;
  final double longitude;
  final double accuracy;
  final double altitude;

  final DateTime timestamp;
  final String? locationName;
  final String? address;
  final String? city;
  final String? country;

  LocationData({
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.altitude,
    required this.timestamp,
    this.locationName,
    this.address,
    this.city,
    this.country,
  });

  factory LocationData.fromPosition(
    Position position, {
    String? locationName,
    String? address,
    String? city,
    String? country,
  }) {
    return LocationData(
      latitude: position.latitude,
      longitude: position.longitude,
      accuracy: position.accuracy,
      altitude: position.altitude,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        position.timestamp.millisecondsSinceEpoch,
      ),
      locationName: locationName,
      address: address,
      city: city,
      country: country,
    );
  }

  LocationData copyWith({
    String? locationName,
    String? address,
    String? city,
    String? country,
  }) {
    return LocationData(
      latitude: latitude,
      longitude: longitude,
      accuracy: accuracy,
      altitude: altitude,
      timestamp: timestamp,
      locationName: locationName ?? this.locationName,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  String get displayAddress {
    if (address != null && address!.isNotEmpty) {
      return address!;
    }
    if (locationName != null && locationName!.isNotEmpty) {
      return locationName!;
    }
    if (city != null && city!.isNotEmpty) {
      return city!;
    }
    return 'Unknown Location';
  }

  @override
  String toString() {
    String locationInfo = '';
    if (locationName != null && locationName!.isNotEmpty) {
      locationInfo += 'Location: $locationName\n';
    }
    if (address != null && address!.isNotEmpty) {
      locationInfo += 'Address: $address\n';
    }
    if (city != null && city!.isNotEmpty) {
      locationInfo += 'City: $city\n';
    }
    if (country != null && country!.isNotEmpty) {
      locationInfo += 'Country: $country\n';
    }

    locationInfo +=
        'Latitude: ${latitude.toStringAsFixed(6)}\n'
        'Longitude: ${longitude.toStringAsFixed(6)}\n'
        'Accuracy: ${accuracy.toStringAsFixed(2)} meters\n'
        'Altitude: ${altitude.toStringAsFixed(2)} meters\n'
        'Updated: ${timestamp.toString().substring(0, 19)}';

    return locationInfo;
  }
}

enum LocationPermissionStatus {
  granted,
  denied,
  deniedForever,
  serviceDisabled,
}
