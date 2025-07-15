import 'dart:developer';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/api_const.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:location/location.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher.dart';

//  torento  lat long
// [log] lat43.653226
// [log] long-79.3831843

class LocationController extends GetxController {
  Location location = Location();
  double? latitude;
  double? longitude;
  bool? serviceEnabled;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  _isServiceEnabled() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled!) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled!) {
        // Handle if user denies turning on location services.
        return;
      }
    }
  }

  _locationPermission() async {
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        // Handle if user denies the location permission.
        return;
      }
    }
  }

  Future fetchLocation() async {
    await _isServiceEnabled();
    if (serviceEnabled!) {
      await _locationPermission();
      if (permissionGranted == PermissionStatus.granted) {
        try {
          locationData = await location.getLocation();

          // latitude = 43.653226;
          // longitude = -79.3831843;

          latitude = locationData!.latitude;
          longitude = locationData!.longitude;

          log("lat" + latitude.toString());
          log("long" + longitude.toString());
        } catch (e) {
          // TODO

          print(e);
        }
      }
    }
  }

  locationService(context) async {
    await _isServiceEnabled();
    if (serviceEnabled!) {
      await _locationPermission();
      if (permissionGranted == PermissionStatus.granted) {
        // showToast("Location Granted", true);
      } else if (permissionGranted == PermissionStatus.grantedLimited) {
        showSnackBar(context, "Granted Limited");
      } else if (permissionGranted == PermissionStatus.denied) {
        showSnackBar(context, "Denied");
      } else if (permissionGranted == PermissionStatus.deniedForever) {
        showSnackBar(context, "Denied Forever");
      }
    }
  }

  getTimeZone({required double lat, required double long}) async {
    String timeZone = getTimeZoneApi();
    return timeZone;
  }

  Future<Position> determinePosition(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showSnackBar(context,
          "Location permission denied permanently , You have to give permission",
          action: SnackBarAction(
              label: "Open",
              onPressed: () {
                AppSettings.openAppSettings(type: AppSettingsType.location);
              }));

      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  setPosition(context) async {
    Position p = await determinePosition(context);

    // longitude = -79.3831843;
    // latitude = 43.653226;

    longitude = p.longitude;
    latitude = p.latitude;

    log("lat" + latitude.toString());
    log("long" + longitude.toString());
    ///////////
    update();
  }

  ///
}

Future<void> getLocation() async {
  var location = Location();

  // Check if location service is enabled and permissions are granted
  bool serviceEnabled;
  PermissionStatus permissionGranted;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      // Handle case where user declines to enable location services
      return;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      // Handle case where user declines to grant location permissions
      return;
    }
  }

  // Now fetch the location
  try {
    // var currentLocation = await location.getLocation();
    // Use currentLocation.latitude and currentLocation.longitude
    // print("Location: ${currentLocation.latitude}, ${currentLocation.longitude}");
  } catch (e) {
    // Handle any exceptions that might occur while fetching location
    print("Error getting location: $e");
  }
}

// Function to open the map app
void openMap(double latitude, double longitude) async {
  final googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
  final appleMapsUrl =
      Uri.parse('https://maps.apple.com/?q=$latitude,$longitude');

  if (await canLaunchUrl(googleMapsUrl)) {
    await launchUrl(googleMapsUrl);
  } else if (await canLaunchUrl(appleMapsUrl)) {
    await launchUrl(appleMapsUrl);
  } else {
    throw 'Could not launch map.';
  }
}
