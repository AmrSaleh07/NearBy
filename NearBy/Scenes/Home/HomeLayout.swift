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
    lazy var modeButton: UIButton = {
       var button = UIButton()
        button.setTitle("Realtime", for: .normal)
        button.setTitleColor( #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), for: .normal)
        return button
    }()
    
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
