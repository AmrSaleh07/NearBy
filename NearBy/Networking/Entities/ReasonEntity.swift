//
//  Reason.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import Gloss

//MARK: - Reason
public struct Reason: Glossy {

    public let count : Int?
    public let items : [Item]?



    //MARK: Decodable
    public init?(json: JSON){
        count = "count" <~~ json
        items = "items" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "count" ~~> count,
        "items" ~~> items,
        ])
    }

}
