//
//  Defaults.swift
//  NearBy
//
//  Created by Amr Saleh on 9/27/21.
//

import Foundation

/// This class contains some variables, each variable manages a value stored in UserDefaults.
///
/// To store a new value in UserDefaults, add a variable with setter and getter to store, update or remove value in UserDefaults.
/// - Note: If you set a variable to nil, this will remove the key and value from UserDefaults.
/// - Author: Amr Saleh.
/// - Date: Dec 18, 2020.
class Defaults {
    
    static var appLanguageIdentifier: String? {
        get { return DefaultsKey.appLanguageIdentifier.get() as? String }
        set { newValue != nil ? DefaultsKey.appLanguageIdentifier.set(value: newValue!) : DefaultsKey.appLanguageIdentifier.remove() }
    }
    
    static var useRealTimeMode: Bool? {
        get { return DefaultsKey.useRealTimeMode.get() as? Bool }
        set { newValue != nil ? DefaultsKey.useRealTimeMode.set(value: newValue!) : DefaultsKey.useRealTimeMode.remove() }
    }
}

/// Contains the options of data you nedd to store in UserDefaults.
/// It also contains some methods to manage store, update or remove values from UserDefaults.
/// - Author: Amr Saleh.
/// - Date: Dec 18, 2020.
private enum DefaultsKey:String {

    case appLanguageIdentifier
    case useRealTimeMode
    
    /// Set a value in UserDefaults.
    ///
    /// - Parameter value: A value to store.
    func set(value:Any) {
        UserDefaults.standard.setValue(value, forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    /// Retrieve a value from UserDefaults
    ///
    /// - Returns: A Value for a specific key.
    func get() -> Any? {
        let value = UserDefaults.standard.value(forKey: self.rawValue)
        return value
    }
    
    /// Removes value from UserDefaults.
    func remove() {
        UserDefaults.standard.removeObject(forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
}
