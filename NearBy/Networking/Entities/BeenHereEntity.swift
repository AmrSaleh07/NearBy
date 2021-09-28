//
//  BeenHereEntity.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import Gloss

//MARK: - LabeledLatLng
public struct LabeledLatLng: Glossy {

    public let label : String?
    public let lat : Double?
    public let lng : Double?



    //MARK: Decodable
    public init?(json: JSON){
        label = "label" <~~ json
        lat = "lat" <~~ json
        lng = "lng" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "label" ~~> label,
        "lat" ~~> lat,
        "lng" ~~> lng,
        ])
    }

}
