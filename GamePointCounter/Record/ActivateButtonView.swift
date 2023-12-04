//
//  ActivateView.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/18.
//

import SwiftUI

struct ActivateButtonView: View {

    @Binding var isAddButtonActive: Bool
    @Binding var isResultButtonActive: Bool

    var body: some View {
        VStack {
            Spacer()

            HStack {

                Button(action: {
                    isResultButtonActive = true
                }) {
                    Image(systemName: "crown")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 24)
                .padding(.leading, 32)

                Spacer()

                Button(action: {
                    isAddButtonActive = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 24)
                .padding(.trailing, 32)
            }
        }
    }
}

#Preview {
    @State var isAddButtonActive = false
    @State var isResultButtonActive = false
    return ActivateButtonView(isAddButtonActive: $isAddButtonActive,
                              isResultButtonActive: $isResultButtonActive)
}
