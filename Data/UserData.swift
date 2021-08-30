//
//  UserData.swift
//  JapHelper
//
//  Created by Kovs on 21.11.2020.
//

import Foundation
import SwiftUI

final class UserData: ObservableObject {
    @Published var lessons = lessonsData
}

struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {
        
    }
}

struct AnimatedButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut)
    }
}

extension TextField {
    
    func PrettyTextField() -> some View {
        self
            .padding(.horizontal)
            .cornerRadius(20)
            .contentShape(Rectangle())
            .background(Color.white)
            .font(.system(size: 18))
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
    }
}
