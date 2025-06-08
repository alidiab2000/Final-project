import '../data/location_model.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final LocationData locationData;
  final bool isTracking;

  LocationLoaded({required this.locationData, this.isTracking = false});
}

class LocationPermissionDenied extends LocationState {
  final String message;

  LocationPermissionDenied(this.message);
}

class LocationServiceDisabled extends LocationState {}

class LocationError extends LocationState {
  final String error;

  LocationError(this.error);
}
