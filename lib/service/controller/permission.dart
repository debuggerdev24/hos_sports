import 'dart:developer';
import 'package:permission_handler/permission_handler.dart';

class CheckLocationPermission {
  Future<bool> checkLocationPermission() async {
    // Check the current permission status
    PermissionStatus status = await Permission.location.status;

    if (status.isGranted) {
      // Location permission already granted
      return true;
    } else if (status.isDenied) {
      // Request permission if denied
      PermissionStatus newStatus = await Permission.location.request();
      if (newStatus.isGranted) {
        // Location permission granted
        return true;
      } else {
        // Permission denied or permanently denied
        return false;
      }
    } else if (status.isPermanentlyDenied) {
      // Location permission is permanently denied
      return false;
    }

    return false; // Default case
  }
}
