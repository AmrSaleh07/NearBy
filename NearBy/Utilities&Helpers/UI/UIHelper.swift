//
//  UIHelper.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import Toast_Swift
import NVActivityIndicatorView

class UIHelper {
    
    /// shows activity indicator while loading the data from API.
    class func showActivityIndicator() {
        let activityData = ActivityData(size: nil, message: "Please wait...", messageFont: nil, messageSpacing: nil, type: .circleStrokeSpin,
                                        color: UIColor.black, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.24)
                                        , textColor: nil)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
    }
    
    /// Hide the activity indicator after loading the data from API.
    class func hideActivityIndicator() {
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        }
    }
    
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
    
    /// Show alert dialog with a specific actions.
    /// - Parameters:
    ///   - title: Alert title.
    ///   - message: Alert message.
    ///   - actions: Alert list of actions.
    /// - Author: Amr Saleh.
    /// - Date: 19 Aug, 2021.
    class func showAlert(title: String, message: String, actions: [UIAlertAction]) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        for action in actions {
            alert.addAction(action)
        }
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    /// Show permission popup dialog to ask user for access.
    /// - Parameters:
    ///   - title: Permission title.
    ///   - message: Permission message.
    /// - Author: Amr Saleh.
    /// - Date: 19 Aug, 2021.
    class func showAccessPermissionPopUp(title: String, message: String) {
        var actions = [UIAlertAction]()
        let enableAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) {_ in 
            UIHelper.hideActivityIndicator()
        }
        
        actions.append(enableAction)
        actions.append(cancelAction)
        UIHelper.showAlert(title: title, message: message, actions: actions)
    }
}
