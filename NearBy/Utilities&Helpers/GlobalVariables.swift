//
//  GlobalVariables.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import CoreLocation

var serverURL = Environment().configuration(PlistKey.serverURL)
var isLocationAccessAuthorized = false
var userCurrentLocation: CLLocation?
