import 'package:final_project/core/helper/extensions.dart';
import 'package:final_project/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../logic/location_cubit.dart';
import '../logic/location_state.dart';

class LocationView extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location'),
        actions: [
          BlocBuilder<LocationCubit, LocationState>(
            builder: (context, state) {
              if (state is LocationLoaded && state.isTracking) {
                return IconButton(
                  icon: Icon(Icons.stop),
                  onPressed: () {
                    context.read<LocationCubit>().stopLocationTracking();
                  },
                  tooltip: 'Stop Tracking',
                );
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSearchBar(context),
                  SizedBox(height: 20),
                  _buildLocationInfo(state),
                  SizedBox(height: 30),
                  _buildActionButtons(context, state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _searchController,
                onTapOutside: (event) {},
                decoration: InputDecoration(
                  hintText: 'Search for a location...',
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    context.read<LocationCubit>().searchLocation(value);
                  }
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                if (_searchController.text.trim().isNotEmpty) {
                  context.read<LocationCubit>().searchLocation(
                    _searchController.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInfo(LocationState state) {
    if (state is LocationInitial) {
      return Text(
        "Welcome! Search for a location or tap a button below to get your current location.",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      );
    } else if (state is LocationLoading) {
      return Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text("Getting your location..."),
        ],
      );
    } else if (state is LocationLoaded) {
      return Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      state.isTracking ? "Live Location" : "Current Location",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (state.isTracking) ...[
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 12),
              // Display location name prominently if available
              if (state.locationData.displayAddress != 'Unknown Location') ...[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.place, size: 20, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            "Location",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        state.locationData.displayAddress,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
              ],
              ExpansionTile(
                title: Text(
                  "Detailed Information",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      state.locationData.toString(),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else if (state is LocationError) {
      return Card(
        color: Colors.red.shade50,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.error, color: Colors.red),
              SizedBox(width: 8),
              Expanded(
                child: Text(state.error, style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ),
      );
    } else if (state is LocationPermissionDenied) {
      return Card(
        color: Colors.orange.shade50,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  state.message,
                  style: TextStyle(color: Colors.orange.shade700),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (state is LocationServiceDisabled) {
      return Card(
        color: Colors.red.shade50,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.location_disabled, color: Colors.red),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Location services are disabled. Please enable location services.",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox.shrink();
  }

  Widget _buildActionButtons(BuildContext context, LocationState state) {
    bool isLoading = state is LocationLoading;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed:
                    isLoading
                        ? null
                        : () {
                          context.read<LocationCubit>().getCurrentLocation();
                        },
                icon: Icon(Icons.my_location),
                label: Text('Get Current Location'),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed:
                    isLoading
                        ? null
                        : () {
                          context.read<LocationCubit>().getLastKnownLocation();
                        },
                icon: Icon(Icons.history),
                label: Text('Last Known'),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        if (state is LocationLoaded) _buildStartButton(context, state),
      ],
    );
  }

  Widget _buildStartButton(BuildContext context, LocationLoaded state) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          Future.wait<bool>([
            prefs.setDouble("latitude", state.locationData.latitude),
            prefs.setDouble("longitude", state.locationData.longitude),
            prefs.setString(
              "displayAddress",
              state.locationData.displayAddress,
            ),
          ]);
          if (context.mounted) {
            context.pushReplacementNamed(Routes.navigationBarMenu);
          }
        },
        child: Text('Start'),
      ),
    );
  }
}
