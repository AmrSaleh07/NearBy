//
//  GroupEntity.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import Gloss

//MARK: - Group
public struct Group: Glossy {

    public let items : [Item]?
    public let name : String?
    public let type : String?



    //MARK: Decodable
    public init?(json: JSON){
        items = "items" <~~ json
        name = "name" <~~ json
        type = "type" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "items" ~~> items,
        "name" ~~> name,
        "type" ~~> type,
        ])
    }

}
