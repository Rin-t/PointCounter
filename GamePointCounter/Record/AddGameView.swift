//
//  AddGameView.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/12/3.
//

import SwiftUI
import SwiftData

struct AddGameView: View {

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @Query private var categories: [Game] = []
    @Query private var participants: [Participant] = []

    @State private var inputText = ""
    @State private var scores: [Participant: Int] = [:]

    var body: some View {
        List {
            Section("ゲーム名を入力") {
                TextField("ゲーム名", text: $inputText)
            }

            Section("スコアを入力") {
                ForEach(participants) { participant in
                    HStack {
                        Text(participant.name)
                            .padding(.trailing, 12)
                        TextField("スコア", value: $scores[participant], format: .number)
                            .keyboardType(.numberPad)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    insert(category: inputText)
                    dismiss()
                } label: {
                    Text("追加")
                }
                .disabled(inputText.isEmpty)

            }
        }
    }

    func insert(category: String) {
        let scores = self.scores.map {
            Score(participant: $0.key, score: $0.value)
        }

        let data = Game(id: UUID().uuidString,
                        name: inputText,
                        scores: scores)
        context.insert(data)
    }
}

#Preview {
    AddGameView()
        .modelContainer(for: Game.self)
}
