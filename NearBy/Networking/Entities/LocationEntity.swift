//
//  LocationEntity.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import Gloss

//MARK: - Location
public struct Location: Glossy {

    public let address : String?
    public let cc : String?
    public let country : String?
    public let distance : Int?
    public let formattedAddress : [String]?
    public let labeledLatLngs : [LabeledLatLng]?
    public let lat : Double?
    public let lng : Double?
    public let state : String?



    //MARK: Decodable
    public init?(json: JSON){
        address = "address" <~~ json
        cc = "cc" <~~ json
        country = "country" <~~ json
        distance = "distance" <~~ json
        formattedAddress = "formattedAddress" <~~ json
        labeledLatLngs = "labeledLatLngs" <~~ json
        lat = "lat" <~~ json
        lng = "lng" <~~ json
        state = "state" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "address" ~~> address,
        "cc" ~~> cc,
        "country" ~~> country,
        "distance" ~~> distance,
        "formattedAddress" ~~> formattedAddress,
        "labeledLatLngs" ~~> labeledLatLngs,
        "lat" ~~> lat,
        "lng" ~~> lng,
        "state" ~~> state,
        ])
    }

}


//MARK: - Ne
public struct Ne: Glossy {

    public let lat : Float?
    public let lng : Float?



    //MARK: Decodable
    public init?(json: JSON){
        lat = "lat" <~~ json
        lng = "lng" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "lat" ~~> lat,
        "lng" ~~> lng,
        ])
    }

}

//MARK: - SuggestedBound
public struct SuggestedBound: Glossy {

    public let ne : Ne?
    public let sw : Ne?



    //MARK: Decodable
    public init?(json: JSON){
        ne = "ne" <~~ json
        sw = "sw" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "ne" ~~> ne,
        "sw" ~~> sw,
        ])
    }

}
