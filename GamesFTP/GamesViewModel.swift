//
//  GamesViewModel.swift
//  GamesFTP
//
//  Created by Emanuel Morales on 04/02/25.
//

import Foundation

class GamesViewModel: ObservableObject {
    @Published var listGames = [GamesModel]()
    @Published var filterGames = [GamesModel]()
    init(){
        getListGames()
    }
    func getListGames(){
        networkManager.shared.getListOfGames{ result in
            DispatchQueue.main.async {
                switch result {
                case.success(let listGames):
                    print("Numero de juegos: \(listGames.count)")
                    self.listGames = listGames
                    self.filterGames = listGames
                case.failure(let error):
                    print("error: \(error.localizedDescription)")
                }
            }
        }
    }
    func filtroGame(title: String){
        if title.isEmpty{
            filterGames = listGames
        } else {
            filterGames = listGames.filter({game in game.title.lowercased().contains(title.lowercased())})
        }
           
    }
}
