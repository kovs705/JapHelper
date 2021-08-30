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

struct AnimatedButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut)
    }
}

struct PrettyTextField: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .cornerRadius(20)
            .contentShape(Rectangle())
            .background(Color.white)
            .font(.system(size: 18))
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
    }
}
