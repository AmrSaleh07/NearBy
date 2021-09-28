//
//  NearByPlacesService.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import Moya

enum NearByPlacesService {
    case recommended(lat: Double, lng: Double)
}

extension NearByPlacesService: TargetType {
    var baseURL: URL {
        return URL(string: serverURL)!
    }
    
    var path: String {
        switch self {
        case .recommended:
            return "/venues/explore"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: self.parameters!, encoding: self.parameterEncoding)
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .recommended(lat: let lat, lng: let lng):
            let param: [String: Any] = ["client_id":Constants.clientID,
                                        "client_secret": Constants.clientSecret,
                                        "v":"20210928",
                                        "ll": "\(lat),\(lng)",
                                        "venuePhotos":1,
                                        "radius":1000]
            return param
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .recommended:
            return URLEncoding.queryString
        }
    }
}
