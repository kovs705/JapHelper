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
    @State private var level = "None"
    
    let levels = ["N5", "N4", "N3", "N2", "N1", "None"]
    
    // createGroup() {
        // function to create a group
        
    //}
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                VStack {
                    
                    // preview of the future group with the name, number of words and level (if it has):
                    ZStack {
                        VStack {
                            // MARK: - Name of the group
                            
                            if name.count == 0 {
                                Text("Group name")
                                    .font(.caption)
                            } else {
                                Text("\(name)")
                                    .font(.caption)
                            }
                            // MARK: - Detail info
                            HStack {
                                Text("Number of words: 23")
                                    .font(.caption2)
                                if level == "None" {
                                    Text("Level: \("None")")
                                        .font(.caption2)
                                } else {
                                    Text("\(level)")
                                        .font(.caption2)
                                }
                            }
                        }
                        // end of VStack
                    }
                    .background(BlurView(style: .regular))
                    .frame(width: UIScreen.main.bounds.width - 45, height: 75)
                    .padding()
                    //
                    
                    // MARK: - TextFields
                    
                    TextField("Name of a group..", text: $name)
                        .PrettyTextField()
                    TextField("Type some notes (optional)", text: $note)
                        .PrettyTextField()
                    
                    // MARK: - Section
                    
                    Section {
                        Picker("Select the level", selection: $level) {
                            ForEach(levels, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    // MARK: - Button
                    
                    Button(action: {
                        // createGroup()
                    }) {
                        if name.count > 0 {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.blue)
                                Text("Create")
                                    .font(.callout)
                            }
                            .padding()
                        } else {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.gray)
                                Text("Create")
                                    .font(.callout)
                            }
                        }
                    }
                    .buttonStyle(AnimatedButton())
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
