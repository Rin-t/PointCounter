//
//  LottieView.swift
//  PointCouter
//
//  Created by Rin on 2023/12/03.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var name: String
    var animationView = LottieAnimationView()
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        // 表示したいアニメーションのファイル名
        animationView.animation = LottieAnimation.named(name)
        // 比率
        animationView.contentMode = .scaleAspectFit
        // ループモード
        animationView.loopMode = .loop
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}
