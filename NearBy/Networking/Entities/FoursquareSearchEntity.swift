//
//  FoursquareSearchEntity.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import Gloss

//MARK: - RootClass
public struct FoursquareSearchEntity: Glossy {

    public let meta : Meta?
    public let response : Response?



    //MARK: Decodable
    public init?(json: JSON){
        meta = "meta" <~~ json
        response = "response" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "meta" ~~> meta,
        "response" ~~> response,
        ])
    }

}
