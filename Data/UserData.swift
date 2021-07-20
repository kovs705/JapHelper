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


// MARK: - Garbage
struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal)
            .background(Color.offWhite)
            .cornerRadius(15)
            .foregroundColor(.black)
    }
    var body: some View {
        ZStack {
            
        }
    }
}

/*
 static func alert(title: String, message: String) {
     let alert = UIAlertController(title: "Create a group..", message: "Add", preferredStyle: .alert)
     alert.addTextField() { textField in
         textField.placeholder = "Group name.."
     }
     alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
     
 }
 
 */
