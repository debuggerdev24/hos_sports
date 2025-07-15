import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';

// showToastd(String msg, bool status, {ToastGravity? gravity}) {
//   Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: gravity ?? ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: AppColor.primary,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }

showToast(String? msg, bool stauts, context, {SnackBarAction? gravity}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          msg!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      elevation: 5,
      closeIconColor: Colors.white,
      backgroundColor: AppColor.primary,
      action: gravity,
      duration: const Duration(seconds: 10),
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black)),
    ),
  );
}

showSnackBar(context, String? msg, {SnackBarAction? action}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          msg!,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      elevation: 5,
      closeIconColor: Colors.black,
      backgroundColor: Colors.white,
      action: action,
      duration: const Duration(seconds: 10),
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black)),
    ),
  );
}

void showCenterSnackBar(BuildContext context, String? msg,
    {SnackBarAction? action}) {
  final overlay = Overlay.of(context);

  // Declare the overlayEntry variable first
  late OverlayEntry overlayEntry;

  // Now create the OverlayEntry
  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).size.height * 0.4, // Center vertically
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  msg!,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              if (action != null) action, // Add action if provided
              IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  overlayEntry
                      .remove(); // This works because overlayEntry is now declared
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );

  // Show the custom snack bar
  overlay?.insert(overlayEntry);

  // Remove after the duration (optional)
  Future.delayed(const Duration(seconds: 10), () {
    overlayEntry.remove();
  });
}

void showAutoCloseAlertDialog(
  BuildContext context,
  String? message, {
  VoidCallback? onTap,
  int? closeTime,
  String? no,
  bool? barrierDismissible,
}) {
  // Show the dialog
  showDialog(
    barrierDismissible: barrierDismissible ?? true,
    context: context,
    barrierColor: const Color.fromARGB(201, 0, 0, 0),
    builder: (context) => AlertDialog(
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(20)), // Rounded corners
      ),
      // title: const Text(
      //   "Alert",
      //   style: TextStyle(color: Colors.white),
      // ),
      content: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          message!,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      actions: [
        if (no != null)
          ElevatedButton(
            onPressed: onTap,
            child: const Text("Yes"),
          ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog manually
          },
          child: Text(no ?? "Close"),
        ),
      ],
    ),
  );

  // Automatically close the dialog after 3 seconds
  Future.delayed(Duration(seconds: closeTime ?? 3), () {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop(); // Close the dialog automatically
    }
  });
}

void showAutoCloseAlertRickDialog(
  BuildContext context,
  String? message, {
  VoidCallback? onTap,
  int? closeTime,
  String? no,
  bool? barrierDismissible,
}) {
  /// Create a flag to track manual dismissal
  bool isManuallyClosed = false;

  /// Show the dialog
  showDialog(
    barrierDismissible: barrierDismissible ?? true,
    context: context,
    barrierColor: const Color.fromARGB(201, 0, 0, 0),
    builder: (context) => AlertDialog(
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(20)), // Rounded corners
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          message!,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      actions: [
        if (no != null)
          ElevatedButton(
            onPressed: () {
              isManuallyClosed = true; // Mark as manually closed
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              if (onTap != null) onTap();
            },
            child: const Text("Yes"),
          ),
        ElevatedButton(
          onPressed: () {
            isManuallyClosed = true; // Mark as manually closed
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: Text(no ?? "Close"),
        ),
      ],
    ),
  );

  // Automatically close the dialog after a delay if not manually closed
  Future.delayed(Duration(seconds: closeTime ?? 3), () {
    if (!isManuallyClosed && Navigator.canPop(context)) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }
  });
}

void showCustomNotification(context, msg) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top +
          10, // Position below the status bar
      left: 10,
      right: 10,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    "assets/images/ic_launcher.png",
                    height: 35,
                    width: 35,
                  )),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  msg ?? "",
                  maxLines: 3,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  overlay?.insert(overlayEntry);

  // Remove the notification after 3 seconds
  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
