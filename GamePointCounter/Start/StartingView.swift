//
//  StartingView.swift
//  PointCouter
//
//  Created by Rin on 2023/12/03.
//

import SwiftUI

struct StartingView: View {
    @State private var isShowingSettingParticipantView = false

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("ゲーム得点管理")
                    .font(.title)
                    .padding(.top, 48)

                LottieView(name: "battle_animation")

                Button(action: {
                    isShowingSettingParticipantView.toggle()
                }) {
                    Capsule()
                        .fill(Color.blue)
                        .frame(width: 200, height: 50)
                        .overlay(Text("スタート").foregroundColor(.white))
                }
                Spacer()
            }
            .navigationDestination(isPresented: $isShowingSettingParticipantView) {
                SettingParticipantView()
            }
        }

    }
}

#Preview {
    StartingView()
}
