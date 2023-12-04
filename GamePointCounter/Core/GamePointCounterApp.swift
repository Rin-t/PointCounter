//
//  GamePointCounterApp.swift
//  GamePointCounter
//
//  Created by Rin on 2023/12/03.
//

import SwiftUI
import SwiftData

@main
struct GamePointCounterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Participant.self, Game.self, Score.self])
        }
    }
}
