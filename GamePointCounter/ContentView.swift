//
//  ContentView.swift
//  GamePointCounter
//
//  Created by Rin on 2023/12/03.
//

import SwiftUI

struct ContentView: View {

    @AppStorage("isInTheMiddleOfGame") var isInTheMiddleOfGame = false

    var body: some View {
        if isInTheMiddleOfGame {
            RecordListView()
        } else {
            StartingView()
        }
    }
}

#Preview {
    ContentView()
}
