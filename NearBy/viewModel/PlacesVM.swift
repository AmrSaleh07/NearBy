//
//  PlacesVM.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import RxCocoa

class PlacesVM {
    
    // MARK: - Properties
    private var gateway: Gateway<NearByPlacesService>!
    var didFetchNearByPlacesSubject = BehaviorRelay<Bool>(value: false)
    var nearByPlaces: [Item] = []

    
    // MARK: - Initialization
    init(gateway: Gateway<NearByPlacesService>) {
        self.gateway = gateway
    }
}

// MARK: - Methods
extension PlacesVM {

    /// Get nearby places from the API.
    /// - Parameters:
    ///   - lat: User latitude.
    ///   - lastName: User longitude.
    /// - Author: Amr Saleh.
    /// - Date: 29 Jun 2021.
    func getNearByPlaces(lat: Double, lng: Double) {
        gateway.request(target: .recommended(lat: lat, lng: lng), responseType: FoursquareSearchEntity.self) { [weak self] (_, _, _, response) in
            guard let self = self else { return }
            UIHelper.hideActivityIndicator()
            self.nearByPlaces = response?.response?.groups?.first?.items ?? []
            self.didFetchNearByPlacesSubject.accept(true)
        }
    }
}
