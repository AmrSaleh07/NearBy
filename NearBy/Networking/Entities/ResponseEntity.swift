//
//  ResponseEntity.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import Gloss

//MARK: - Response
public struct Response: Glossy {

    public let groups : [Group]?
    public let headerFullLocation : String?
    public let headerLocation : String?
    public let headerLocationGranularity : String?
    public let query : String?
    public let suggestedBounds : SuggestedBound?
    public let suggestedRadius : Int?
    public let totalResults : Int?



    //MARK: Decodable
    public init?(json: JSON){
        groups = "groups" <~~ json
        headerFullLocation = "headerFullLocation" <~~ json
        headerLocation = "headerLocation" <~~ json
        headerLocationGranularity = "headerLocationGranularity" <~~ json
        query = "query" <~~ json
        suggestedBounds = "suggestedBounds" <~~ json
        suggestedRadius = "suggestedRadius" <~~ json
        totalResults = "totalResults" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "groups" ~~> groups,
        "headerFullLocation" ~~> headerFullLocation,
        "headerLocation" ~~> headerLocation,
        "headerLocationGranularity" ~~> headerLocationGranularity,
        "query" ~~> query,
        "suggestedBounds" ~~> suggestedBounds,
        "suggestedRadius" ~~> suggestedRadius,
        "totalResults" ~~> totalResults,
        ])
    }

}
