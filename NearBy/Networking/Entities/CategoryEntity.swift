//
//  CategoryEntity.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//


import Foundation
import Gloss

//MARK: - Category
public struct Category: Glossy {

    public let icon : Icon?
    public let id : String?
    public let name : String?
    public let pluralName : String?
    public let primary : Bool?
    public let shortName : String?



    //MARK: Decodable
    public init?(json: JSON){
        icon = "icon" <~~ json
        id = "id" <~~ json
        name = "name" <~~ json
        pluralName = "pluralName" <~~ json
        primary = "primary" <~~ json
        shortName = "shortName" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "icon" ~~> icon,
        "id" ~~> id,
        "name" ~~> name,
        "pluralName" ~~> pluralName,
        "primary" ~~> primary,
        "shortName" ~~> shortName,
        ])
    }

}
