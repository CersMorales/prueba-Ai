//
//  GamesModel.swift
//  GamesFTP
//
//  Created by Emanuel Morales on 04/02/25.
//

import Foundation

struct GamesModel: Codable, Hashable {
    let id : Int
    let title : String
    let thumbnail : String
    let short_description : String
    let game_url : String
    let genre : String
    let platform : String
    let publisher : String
    let developer : String
    let release_date : String
    let freetogame_profile_url : String
    
}
