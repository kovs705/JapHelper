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
    @State private var level = ""
    
    let levels = ["N5", "N4", "N3", "N2", "N1", "None"]
    
    // createGroup() {
        // function to create a group
        
    //}
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                VStack {
                    TextField("Name of a group..", text: $name)
                        .padding(.horizontal)
                        .cornerRadius(20)
                        .contentShape(Rectangle())
                        .background(Color.white)
                        .font(.system(size: 18))
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                    TextField("Type some notes (optional)", text: $note)
                        .padding(.horizontal)
                        .cornerRadius(20)
                        .contentShape(Rectangle())
                        .background(Color.white)
                        .font(.system(size: 18))
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                    
                    Section {
                        Picker("Select the level", selection: $level) {
                            ForEach(levels, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    
                    Button(action: {
                        createGroup()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill()
                        }
                        .padding()
                    }
                    // end of the button
                    
                }
                // end of inner VStack
                
                Spacer()
            }
            // end of outer VStack
            
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
