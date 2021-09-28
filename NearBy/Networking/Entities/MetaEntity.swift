//
//  MetaEntity.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import Gloss

//MARK: - Meta
public struct Meta: Glossy {

    public let code : Int?
    public let requestId : String?



    //MARK: Decodable
    public init?(json: JSON){
        code = "code" <~~ json
        requestId = "requestId" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "code" ~~> code,
        "requestId" ~~> requestId,
        ])
    }

}
