//
//  HomeVC.swift
//  NearBy
//
//  Created by Amr Saleh on 9/27/21.
//

import UIKit
import RxSwift
import CoreLocation

class HomeVC: UIViewController {

    var layout: HomeLayout!
    var viewModel:PlacesVM!
    var locationManager: CLLocationManager!
    var userLocation: CLLocation?
    private var disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isLocationAccessAuthorized {
            locationManager.startUpdatingLocation()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout = HomeLayout(superview: self.view)
        layout.setupViews()
        layout.tableView.dataSource = self
        layout.tableView.delegate = self
        layout.refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        setupRX()
        refreshData()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            UIHelper.makeToast(text: "PLease turn on location services or GPS")
        }
        
        self.title = "Near By"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: layout.modeButton)
        layout.modeButton.addTarget(self, action: #selector(changeMode), for: .touchUpInside)
    }
}

// MARK: - Methods
extension HomeVC {
    
    /// Setup the RX and binding for layout components.
    /// - Author: Amr Saleh.
    /// - Date: 28 Sep 2021.
    func setupRX() {

        viewModel.didFetchNearByPlacesSubject.asDriver().filter({$0}).drive(onNext: { [weak self] _ in
            self?.layout.refreshControl.endRefreshing()
            self?.layout.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    /// Refresh Home data.
    /// - Author: Amr Saleh.
    /// - Date: 28 Sep 2021.
    @objc func refreshData() {
        if userLocation != nil {
            viewModel.getNearByPlaces(lat: userLocation!.coordinate.latitude, lng: userLocation!.coordinate.longitude)
        }
    }
    
    /// Refresh Home data.
    /// - Author: Amr Saleh.
    /// - Date: 28 Sep 2021.
    @objc func changeMode() {
        print("Amr")
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.nearByPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NearByLocationsTVC.reusedIdentifier, for: indexPath) as!
            NearByLocationsTVC
        cell.setupViews()
        cell.selectionStyle = .none
        if let venue = viewModel.nearByPlaces[indexPath.row].venue {
            cell.configureCell(venue: venue)
        }
        return cell

    }
}

// MARK: - CLLocationManagerDelegate
extension HomeVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userCurrentLocation = locations.last
        userLocation = locations.last
        locationManager.stopUpdatingLocation()
        refreshData()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
        default:
            manager.stopUpdatingLocation()
        }
    }
}
