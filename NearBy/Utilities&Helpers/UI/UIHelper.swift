//
//  UIHelper.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import Toast_Swift

class UIHelper {
    
    /// Show toast with specific message.
    /// - Parameters:
    ///   - text: Message to be displayed.
    ///   - showInCenter: Determine if toast is displayed in center or not.
    /// - Author: Amr Saleh.
    /// - Date: 28 Jun 2021.
    class func makeToast(text: String, showInCenter: Bool = false) {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.keyWindow {
                if showInCenter {
                    window.makeToast(text, point: CGPoint(x: Constants.screenWidth / 2, y: Constants.screenHeight / 2), title: nil, image: nil, completion: nil)
                } else {
                    window.makeToast(text)
                }
            }
        }
    }
}
