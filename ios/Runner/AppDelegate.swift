
import UIKit
import Flutter
import GoogleMaps
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
   FirebaseApp.configure()
  //  GMSServices.provideAPIKey("AIzaSyCQP1SBLN_Kl1icBTNZMtpyft80d2dVIKc")
     GMSServices.provideAPIKey("AIzaSyDLg-Cytru077B_ur54iBp4ViZz59ihOz0")


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
