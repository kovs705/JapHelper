//
//  VocabularyAdd.swift
//  JapHelper
//
//  Created by Kovs on 19.10.2020.
//

import SwiftUI


struct VocabularyAdd: View {
    
    private func alert() {
        let alert = UIAlertController(title: "Create a group..", message: "Add", preferredStyle: .alert)
        alert.addTextField() { textField in
            textField.placeholder = "Group name.."
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
    }
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [], animation: .default)
        private var groups: FetchedResults<Group>
    
    let quickList = ["Adjectives", "Verbs", "Nouns"]
    
    @State var showingAlert = false
    
    // quick list of your vocabulary + abbility to create the new list (or group)
    var body: some View {
        VStack {
            HStack {
                Text("Vocabulary")
                    .font(.system(size: 23))
                    .bold()
                
                Spacer()
                
                Button(action: {
                    // create a list with alert:
                    self.showingAlert = true
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.red)
                }
                //.alert(isPresented: $showingAlert) {
                    // alert()
                // }
            }
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
    
    // MARK: - Creating and Deleting words:
    // extension Group {
        //@objc(add)
    // }
}

struct VocabularyAdd_Previews: PreviewProvider {
    static var previews: some View {
        VocabularyAdd()
    }
}
