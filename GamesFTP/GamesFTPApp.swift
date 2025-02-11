//
//  GamesFTPApp.swift
//  GamesFTP
//
//  Created by Emanuel Morales on 04/02/25.
//

import SwiftUI

@main
struct GamesFTPApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
