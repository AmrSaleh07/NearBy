//
//  IconEntity.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

//
//    Icon.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//    The "Swift - Struct - Gloss" support has been made available by CodeEagle
//    More about him/her can be found at his/her website: https://github.com/CodeEagle

import Foundation
import Gloss

//MARK: - Icon
public struct Icon: Glossy {

    public let prefix : String?
    public let suffix : String?



    //MARK: Decodable
    public init?(json: JSON){
        prefix = "prefix" <~~ json
        suffix = "suffix" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "prefix" ~~> prefix,
        "suffix" ~~> suffix,
        ])
    }

}
