//
//  HomeVC.swift
//  NearBy
//
//  Created by Amr Saleh on 9/27/21.
//

import UIKit

class HomeVC: UIViewController {

    var layout: HomeLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout = HomeLayout(superview: self.view)
        layout.setupViews()
        layout.tableView.dataSource = self
        layout.tableView.delegate = self
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NearByLocationsTVC.reusedIdentifier, for: indexPath) as!
            NearByLocationsTVC
        cell.setupViews()
        cell.selectionStyle = .none
//        cell.configureCell(news: articles﻿VM.articles, delegate: self)
        return cell
    }
}
