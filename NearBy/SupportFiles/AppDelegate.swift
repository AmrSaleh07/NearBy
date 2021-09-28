//
//  AppDelegate.swift
//  NearBy
//
//  Created by Amr Saleh on 9/27/21.
//

import UIKit
import CoreLocation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startApplication()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        switch CLLocationManager.authorizationStatus() {
        case .denied, .notDetermined, .restricted:
            isLocationAccessAuthorized = false
        default:
            isLocationAccessAuthorized = true
        }
    }
}

extension AppDelegate {
    
    func startApplication() {
        let initialNv: UINavigationController!
        
        AppDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        initialNv = UINavigationController(rootViewController: instantiateVC(.home))
        AppDelegate.window?.rootViewController = initialNv
        AppDelegate.window?.backgroundColor = UIColor.white
        AppDelegate.window?.makeKeyAndVisible()
    }
}

