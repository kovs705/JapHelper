//
//  VocabularyAdd.swift
//  JapHelper
//
//  Created by Kovs on 19.10.2020.
//

// TODO: Create a sheet to add a new group with the button on dismiss
// TODO: Add a DetailView to check each groups words inside

import CoreData
import Combine
import SwiftUI


struct VocabularyAdd: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Group.entity(), sortDescriptors: [], animation: .default)
    var groups: FetchedResults<Group>
    
    
    let quickList = ["Adjectives", "Verbs", "Nouns"]
    
    @State var showingAlert = false
    @State var groupName: String = ""
    @State private var visible = false
    
    // TODO: quick list of your vocabulary + abbility to create the new list
    var body: some View {
        VStack {
            HStack {
                Text("Vocabulary")
                    .font(.system(size: 23))
                    .bold()
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        self.visible.toggle()
                    }
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.red)
                }
                
            }
            .padding()
            
            if visible {
                    TextField("Group name..", text: $groupName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .transition(.asymmetric(insertion: .move(edge: .top).combined(with: .opacity), removal: .opacity))
                        .frame(height: 75)
                // focus keyboard on click
                
            }
                
            
            List {
                ForEach(groups, id: \.self) { group in
                    HStack {
                        Text(group.name ?? "Unknown name")
                            .font(.headline)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct VocabularyAdd_Previews: PreviewProvider {
    static var previews: some View {
        VocabularyAdd()
    }
}
/*
struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            // .padding(10)
            .background(Color.offWhite)
            .cornerRadius(10)
            .foregroundColor(.black)
    }
}
 
 static func alert(title: String, message: String) {
     let alert = UIAlertController(title: "Create a group..", message: "Add", preferredStyle: .alert)
     alert.addTextField() { textField in
         textField.placeholder = "Group name.."
     }
     alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
     
 }
 
 */
extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}
