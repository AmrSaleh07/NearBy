//
//  VCInstantiate.swift
//  NearBy
//
//  Created by Amr Saleh on 9/27/21.
//

import UIKit
import CoreLocation

enum VC {
    case home
}

/// Instantiate a ViewController with it's dependencies.
///
/// - Parameter vc: Type of the desired ViewController.
/// - Returns: Instance of UIViewController.
/// - Author: Amr Saleh.
/// - Date: Jun 17, 2021.
func instantiateVC(_ vc: VC) -> UIViewController {
    
    switch vc {
    case .home:
        let vc = HomeVC()
        vc.viewModel = PlacesVM(gateway: Gateway<NearByPlacesService>())
        vc.locationManager = CLLocationManager()
        return vc
    }
}

