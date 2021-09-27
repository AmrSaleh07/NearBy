//
//  NearByLocationsTVC.swift
//  NearBy
//
//  Created by Amr Saleh on 9/27/21.
//

import UIKit

class NearByLocationsTVC: UITableViewCell {

    // MARK: - Views
    lazy var locationImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "Screen Shot 2021-09-23 at 5.21.25 PM")
        return imageView
    }()

    lazy var locationNameLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.getFont(type: .bold, size: 17)
        label.numberOfLines = 2
        label.text = "Coffee & Tea"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.getFont(type: .normal, size: 13)
        label.numberOfLines = 0
        label.text = "Coffee & Tea"
        return label
    }()
}

// MARK: - BaseLayoutDelegate
extension NearByLocationsTVC: BaseLayoutDelegate {
    
    func setupViews() {
        
        contentView.addSubviews([locationImageView, locationNameLabel, descriptionLabel])
        
        locationImageView.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(Constants.defaultOffset)
            make.bottom.equalToSuperview().offset(-Constants.defaultOffset)
            make.width.height.equalTo(Constants.screenWidth * 0.3)
        }
        
        locationNameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Constants.defaultOffset)
            make.leading.equalTo(locationImageView.snp.trailing).offset(Constants.defaultOffset)
            make.trailing.equalToSuperview().offset(-Constants.defaultOffset)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(locationNameLabel.snp.bottom).offset(8)
            make.leading.equalTo(locationImageView.snp.trailing).offset(Constants.defaultOffset)
            make.trailing.equalToSuperview().offset(-Constants.defaultOffset)
            make.bottom.lessThanOrEqualToSuperview().offset(-Constants.defaultOffset)
        }
    }
}
