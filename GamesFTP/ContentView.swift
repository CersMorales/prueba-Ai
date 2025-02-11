//
//  ContentView.swift
//  GamesFTP
//
//  Created by Emanuel Morales on 04/02/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var viewModel = GamesViewModel()
    @State private var gameToSearch = ""
    private let numberOfColums = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: numberOfColums) {
                    ForEach(viewModel.filterGames, id: \.self) {nameGame in
                        NavigationLink(destination: GameDetailView(gameSelected: nameGame)){
                            gameCellView(nameGame: nameGame, viewModel: viewModel)
                            
                        }
                        
                    }
                }
                .padding(20)
            }
            .searchable(text: $gameToSearch, prompt: "Buscar juego por titulo")
            .onChange(of: gameToSearch, perform: {filterTitle in
                withAnimation{
                    viewModel.filtroGame(title: filterTitle)
                }
            })
            .navigationBarTitle("Games Free To Pay", displayMode: .inline)
        }
    }
}
struct gameCellView: View{
    let nameGame : GamesModel
    let viewModel :GamesViewModel
    var body: some View{
        ZStack{
         Rectangle()
            .foregroundColor(.gray)
            .cornerRadius(10)
            VStack{
                AsyncImage(url: URL(string: nameGame.thumbnail)) {image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                .clipShape(Rectangle())
                .shadow(radius: 12)
                Text(nameGame.title)
                    .font(.body)
                    .foregroundColor(.white)
            }
        }
    }
}
