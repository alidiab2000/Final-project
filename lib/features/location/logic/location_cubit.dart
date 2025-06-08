import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/location_model.dart';
import '../data/location_service.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationService _locationService;
  StreamSubscription<LocationData>? _locationStreamSubscription;

  LocationCubit(this._locationService) : super(LocationInitial());

  Future<void> checkPermissions() async {
    try {
      LocationPermissionStatus status =
          await _locationService.checkPermissions();

      switch (status) {
        case LocationPermissionStatus.serviceDisabled:
          emit(LocationServiceDisabled());
          break;
        case LocationPermissionStatus.denied:
          emit(LocationPermissionDenied("Location permissions are denied."));
          break;
        case LocationPermissionStatus.deniedForever:
          emit(
            LocationPermissionDenied(
              "Location permissions are permanently denied. Please enable them in settings.",
            ),
          );
          break;
        case LocationPermissionStatus.granted:
          // Permissions granted, can proceed with location operations
          break;
      }
    } catch (e) {
      emit(LocationError("Error checking permissions: $e"));
    }
  }

  Future<void> getCurrentLocation() async {
    emit(LocationLoading());

    try {
      LocationPermissionStatus permissionStatus =
          await _locationService.checkPermissions();

      if (permissionStatus != LocationPermissionStatus.granted) {
        await checkPermissions();
        return;
      }

      LocationData locationData = await _locationService.getCurrentLocation();
      emit(LocationLoaded(locationData: locationData));
    } catch (e) {
      emit(LocationError("Error getting current location: $e"));
    }
  }

  Future<void> getLastKnownLocation() async {
    try {
      LocationData? locationData =
          await _locationService.getLastKnownLocation();

      if (locationData != null) {
        emit(LocationLoaded(locationData: locationData));
      } else {
        emit(LocationError("No last known location available"));
      }
    } catch (e) {
      emit(LocationError("Error getting last known location: $e"));
    }
  }

  Future<void> startLocationTracking() async {
    try {
      LocationPermissionStatus permissionStatus =
          await _locationService.checkPermissions();

      if (permissionStatus != LocationPermissionStatus.granted) {
        await checkPermissions();
        return;
      }

      await _locationStreamSubscription?.cancel();
      _locationStreamSubscription = _locationService.getLocationStream().listen(
        (locationData) {
          emit(LocationLoaded(locationData: locationData, isTracking: true));
        },
        onError: (error) {
          emit(LocationError("Error in location tracking: $error"));
        },
      );
    } catch (e) {
      emit(LocationError("Error starting location tracking: $e"));
    }
  }

  Future<void> stopLocationTracking() async {
    await _locationStreamSubscription?.cancel();
    _locationStreamSubscription = null;

    if (state is LocationLoaded) {
      final currentState = state as LocationLoaded;
      emit(
        LocationLoaded(
          locationData: currentState.locationData,
          isTracking: false,
        ),
      );
    }
  }

  Future<void> searchLocation(String query) async {
    if (query.trim().isEmpty) return;

    emit(LocationLoading());

    try {
      List<dynamic> locations = await _locationService.searchLocationsByName(
        query,
      );
      if (locations.isNotEmpty) {
        var location = locations.first;
        // Convert the search result to LocationData format
        Map<String, String?> addressDetails = await _locationService
            .getDetailedAddress(location.latitude, location.longitude);

        LocationData locationData = LocationData(
          latitude: location.latitude,
          longitude: location.longitude,
          accuracy: 0.0,
          altitude: 0.0,
          timestamp: DateTime.now(),
          locationName: addressDetails['locationName'],
          address: addressDetails['address'],
          city: addressDetails['city'],
          country: addressDetails['country'],
        );

        emit(LocationLoaded(locationData: locationData));
      } else {
        emit(LocationError("No locations found for '$query'"));
      }
    } catch (e) {
      emit(LocationError("Error searching location: $e"));
    }
  }

  @override
  Future<void> close() {
    _locationStreamSubscription?.cancel();
    return super.close();
  }
}
