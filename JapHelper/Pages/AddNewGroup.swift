//
//  AddNewGroup.swift
//  JapHelper
//
//  Created by Kovs on 30.08.2021.
//

import SwiftUI

struct AddNewGroup: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var note = ""
    
    let level = ["N5", "N4", "N3", "N2", "N1"]
    
    createGroup() {
        // function to create a group
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Name of a group..", text: $name)
                    .padding(.horizontal)
                TextField("Type some notes (optional)", text: $note)
                
                Button(action: {
                    
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(C)
                    }
                    .padding()
                }
            }
            
        }
        // end of NavigationView
        .navigationTitle("Create a group")
    }
}

struct AddNewGroup_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGroup()
    }
}
