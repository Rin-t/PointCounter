//
//  RecordListView.swift
//  PointCouter
//
//  Created by Rin on 2023/12/03.
//

import SwiftUI
import SwiftData

struct RecordListView: View {

    @Environment(\.modelContext) private var context

    @Query private var games: [Game]
    @State private var isAddGameSheetActive = false
    @State private var isResultViewActive = false

    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(games) { game in
                        Text(game.name)
                            .swipeActions(edge: .trailing,
                                          allowsFullSwipe: false) {
                                Button {
                                    context.delete(game)
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                            }
                    }
                }
                .sheet(isPresented: $isAddGameSheetActive) {
                    NavigationStack {
                        AddGameView()
                    }
                    .presentationDetents([.medium])
                }
                .navigationDestination(isPresented: $isResultViewActive) {
                    ResultView()
                }

                ActivateButtonView(isAddButtonActive: $isAddGameSheetActive,
                                   isResultButtonActive: $isResultViewActive)
            }
        }
    }
}

#Preview {
    RecordListView()
}
