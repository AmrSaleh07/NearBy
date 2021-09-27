//
//  UIViewExtension.swift
//  NearBy
//
//  Created by Amr Saleh on 9/27/21.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { [weak self] eachView in
            self?.addSubview(eachView)
        }
    }
}
