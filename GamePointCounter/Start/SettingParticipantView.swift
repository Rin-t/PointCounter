//
//  SettingParticipantView.swift
//  PointCouter
//
//  Created by Rin on 2023/12/03.
//

import SwiftUI
import SwiftData

struct SettingParticipantView: View {

    @Environment(\.modelContext) private var context

    @AppStorage("isInTheMiddleOfGame") var isInTheMiddleOfGame = false
    @State private var textFields: [String] = [""]
    @Query private var participants: [Participant] = []

    var body: some View {
        VStack {

            ForEach(textFields.indices, id: \.self) { index in
                TextField("Person \(index + 1)", text: $textFields[index])
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 320, height: 44)
            }
            .padding(.vertical, 12)

            HStack {
                Button(action: removeTextField) {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .foregroundStyle(.red)
                }
                .padding(.trailing, 60)

                Button(action: addTextField) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 44, height: 44)
                }
            }
            .padding(.top, 44)

            Spacer()

            Button(action: {
                savePersons()
                isInTheMiddleOfGame.toggle()
            }) {
                Capsule()
                    .fill(Color.blue)
                    .frame(width: 200, height: 50)
                    .overlay(Text("参加者決定！！").foregroundColor(.white))
            }
        }
        .navigationTitle("参加者の決定")
    }

    func addTextField() {
        textFields.append("")
    }

    func removeTextField() {
        if textFields.count > 1 {
            textFields.removeLast()
        }
    }

    func savePersons() {
        textFields.forEach {
            let participant = Participant(name: $0)
            context.insert(participant)
        }
    }
}

#Preview {
    SettingParticipantView()
        .modelContainer(for: Participant.self)
}
