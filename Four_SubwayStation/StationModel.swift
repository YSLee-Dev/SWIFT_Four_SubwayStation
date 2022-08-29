//
//  StationModel.swift
//  Four_SubwayStation
//
//  Created by 이윤수 on 2022/08/29.
//

import Foundation

struct StationModel : Decodable {
    let SearchInfoBySubwayNameService : SearchInfoBySubwayNameService
    
}

struct SearchInfoBySubwayNameService : Decodable{
    let row : [row]
}

struct row : Decodable{
    let stationName : String
    let lineNumber : String
    
    enum CodingKeys : String, CodingKey{
        case stationName = "STATION_NM"
        case lineNumber = "LINE_NUM"
    }
}
