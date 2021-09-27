//
//  HomeLayout.swift
//  NearBy
//
//  Created by Amr Saleh on 9/27/21.
//

import UIKit
import SnapKit

class HomeLayout: BaseLayout {
    // MARK: - Views
    lazy var refreshControl: UIRefreshControl = {
        var refreshControl = UIRefreshControl()
        return refreshControl
    }()
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.register(NearByLocationsTVC.self, forCellReuseIdentifier: NearByLocationsTVC.reusedIdentifier)
        return tableView
    }()
}

// MARK: - BaseLayoutDelegate
extension HomeLayout: BaseLayoutDelegate {
    
    func setupViews() {
        superview.addSubview(tableView)
        tableView.addSubview(refreshControl)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
