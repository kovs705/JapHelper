//
//  VocabularyAdd.swift
//  JapHelper
//
//  Created by Kovs on 19.10.2020.
//

// TODO: Create a sheet to add a new group with the button on dismiss
// TODO: Add a DetailView to check each groups words inside


import SwiftUI


struct VocabularyAdd: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Group.entity(), sortDescriptors: [], animation: .default)
    var groups: FetchedResults<Group>
    
    static func alert(title: String, message: String) {
        let alert = UIAlertController(title: "Create a group..", message: "Add", preferredStyle: .alert)
        alert.addTextField() { textField in
            textField.placeholder = "Group name.."
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
        
    }
    
    let quickList = ["Adjectives", "Verbs", "Nouns"]
    
    @State var showingAlert = false
    
    // TODO: quick list of your vocabulary + abbility to create the new list
    var body: some View {
        VStack {
            HStack {
                Text("Vocabulary")
                    .font(.system(size: 23))
                    .bold()
                
                Spacer()
                
                Button(action: {
                    // alert()
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.red)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("List name.."), message: nil, dismissButton: .cancel())
                }            }
            .padding()
            // end of HStack
            List {
                ForEach(groups, id: (\.self)) { group in
                    HStack {
                        Text("\(groups.count)")
                        
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
