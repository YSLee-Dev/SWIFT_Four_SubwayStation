//
//  StationArrivalModel.swift
//  Four_SubwayStation
//
//  Created by 이윤수 on 2022/08/30.
//

import Foundation

struct StationArrivalModel : Decodable{
    let realtimeArrivalList : [RealtimeArrivalList]
}

struct RealtimeArrivalList : Decodable{
    let bound: String
    let remainTime: String
    let currentStation: String

    enum CodingKeys: String, CodingKey {
        case bound = "trainLineNm"
        case remainTime = "arvlMsg2"
        case currentStation = "arvlMsg3"
    }
}
