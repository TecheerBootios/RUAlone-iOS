//
//  Lottie.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/07.
//
import SwiftUI
import Lottie
 
struct LottieView: UIViewRepresentable {
    let lottieFile: String
    let contentMode: UIView.ContentMode
 
    let animationView = LottieAnimationView()
 
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = contentMode
        animationView.loopMode = .loop
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
 
        view.addSubview(animationView)
 
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
 
        return view
    }
 
    func updateUIView(_ uiView: UIViewType, context: Context) {
 
    }
}
