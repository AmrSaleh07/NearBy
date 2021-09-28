//
//  HomeVC.swift
//  NearBy
//
//  Created by Amr Saleh on 9/27/21.
//

import UIKit
import RxSwift

class HomeVC: UIViewController {

    var layout: HomeLayout!
    var viewModel:PlacesVM!
    private var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        layout = HomeLayout(superview: self.view)
        layout.setupViews()
        layout.tableView.dataSource = self
        layout.tableView.delegate = self
        layout.refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        setupRX()
        refreshData()
        
    }
}

// MARK: - Methods
extension HomeVC {
    
    /// Setup the RX and binding for layout components.
    /// - Author: Amr Saleh.
    /// - Date: 28 Sep 2021.
    func setupRX() {

        viewModel.didFetchNearByPlacesSubject.asDriver().filter({$0}).drive(onNext: { [weak self] _ in
            self?.layout.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    /// Refresh Home data.
    /// - Author: Amr Saleh.
    /// - Date: 28 Sep 2021.
    @objc func refreshData() {
        viewModel.getNearByPlaces(lat: 30.5965, lng: 32.2715)
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
