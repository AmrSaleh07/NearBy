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
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "images")
        imageView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
        return imageView
    }()

    lazy var locationNameLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.getFont(type: .bold, size: 17)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        var label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.getFont(type: .normal, size: 13)
        label.numberOfLines = 0
        return label
    }()
    
    func configureCell(venue: Venue) {
        locationNameLabel.text = venue.name
        addressLabel.text = venue.location?.address
        locationImageView.setImage(url: (venue.categories?.first?.icon?.prefix ?? "") + "88.png", placeholder: #imageLiteral(resourceName: "images"))
    }
}

// MARK: - BaseLayoutDelegate
extension NearByLocationsTVC: BaseLayoutDelegate {
    
    func setupViews() {
        
        contentView.addSubviews([locationImageView, locationNameLabel, addressLabel])
        
        locationImageView.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(Constants.defaultOffset)
            make.bottom.equalToSuperview().offset(-Constants.defaultOffset)
            make.width.equalTo(Constants.screenWidth * 0.3)
            make.height.equalTo(100)
        }
        
        locationNameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Constants.defaultOffset)
            make.leading.equalTo(locationImageView.snp.trailing).offset(Constants.defaultOffset)
            make.trailing.equalToSuperview().offset(-Constants.defaultOffset)
        }
        
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(locationNameLabel.snp.bottom).offset(8)
            make.leading.equalTo(locationImageView.snp.trailing).offset(Constants.defaultOffset)
            make.trailing.equalToSuperview().offset(-Constants.defaultOffset)
            make.bottom.lessThanOrEqualToSuperview().offset(-Constants.defaultOffset)
        }
    }
}
