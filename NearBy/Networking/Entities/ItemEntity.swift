//
//  ItemEntity.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Foundation
import Gloss

//MARK: - Item
public struct Item: Glossy {

    public let reasonName : String?
    public let summary : String?
    public let type : String?
    public let reasons : Reason?
    public let referralId : String?
    public let venue : Venue?



    //MARK: Decodable
    public init?(json: JSON){
        reasonName = "reasonName" <~~ json
        summary = "summary" <~~ json
        type = "type" <~~ json
        reasons = "reasons" <~~ json
        referralId = "referralId" <~~ json
        venue = "venue" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "reasonName" ~~> reasonName,
        "summary" ~~> summary,
        "type" ~~> type,
        "reasons" ~~> reasons,
        "referralId" ~~> referralId,
        "venue" ~~> venue,
        ])
    }

}
