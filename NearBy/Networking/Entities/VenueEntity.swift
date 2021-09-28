//
//  VenueEntity.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import Gloss

//MARK: - Venue
public struct Venue: Glossy {

    public let categories : [Category]?
    public let id : String?
    public let location : Location?
    public let name : String?
    public let photos : Photo?



    //MARK: Decodable
    public init?(json: JSON){
        categories = "categories" <~~ json
        id = "id" <~~ json
        location = "location" <~~ json
        name = "name" <~~ json
        photos = "photos" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "categories" ~~> categories,
        "id" ~~> id,
        "location" ~~> location,
        "name" ~~> name,
        "photos" ~~> photos,
        ])
    }

}
