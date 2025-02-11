//
//  networkManager.swift
//  GamesFTP
//
//  Created by Emanuel Morales on 04/02/25.
//

import Foundation

enum APError : Error{
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}

class networkManager {
    static let shared = networkManager()
    static let baseURL = "https://www.freetogame.com/api/games"
    
    init () {}
    
    func getListOfGames (completed : @escaping (Result<[GamesModel], APError>) -> Void){
        guard let url = URL(string: networkManager.baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else{
                completed(.failure(.decodingError))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodeResponse = try decoder.decode([GamesModel].self, from: data)
                completed(.success(decodeResponse))
            } catch  {
                print("Debug: error \(error.localizedDescription)")
                completed(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
struct muckData{
    static let game = GamesModel(id: 582, title: "Tarisland", thumbnail: "https://www.freetogame.com/g/582/thumbnail.jpg", short_description: "A cross-platform MMORPG developed by Level Infinite and Published by Tencent.", game_url: "https://www.freetogame.com/open/tarisland", genre: "MMORPG", platform: "PC (Windows)", publisher: "Tencent", developer: "Level Infinite", release_date: "2024-06-22", freetogame_profile_url: "https://www.freetogame.com/tarisland")
}
