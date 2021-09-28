//
//  Photo.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import Gloss

//MARK: - Photo
public struct Photo: Glossy {

    public let count : Int?
    public let groups : [AnyObject]?



    //MARK: Decodable
    public init?(json: JSON){
        count = "count" <~~ json
        groups = "groups" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "count" ~~> count,
        "groups" ~~> groups,
        ])
    }

}
