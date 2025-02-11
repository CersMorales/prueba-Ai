//
//  GameDetailView.swift
//  GamesFTP
//
//  Created by Emanuel Morales on 04/02/25.
//

import SwiftUI

struct GameDetailView: View {
    @State private var isAnimating = false
    let gameSelected : GamesModel
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: gameSelected.thumbnail)) {image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(maxHeight: 250)
            .clipShape(Rectangle())
            .shadow(radius: 12)
            .scaleEffect(isAnimating ? 1.2 : 0.7)
            Text(gameSelected.short_description)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                         isAnimating = true
                    }
                }
                .padding(15)
                .navigationTitle(gameSelected.title)
        }
    }
    
    struct GameDetailView_Previews: PreviewProvider {
        static var previews: some View {
            GameDetailView(gameSelected: muckData.game)
        }
    }
}
