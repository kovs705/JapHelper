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
                
                // Spacer()
                
                VStack {
                    
                    // preview of the future group with the name, number of words and level (if it has):
                    ZStack {
                        VStack(alignment: .leading) {
                            
                            // MARK: - Name of the group
                            if name.count == 0 {
                                Text("Group name")
                                    .font(.headline)
                                    .bold()
                                    .foregroundColor(.white)
                            } else {
                                Text("\(name)")
                                    .font(.headline)
                                    .bold()
                                    .foregroundColor(.white)

                            }
                            
                            // MARK: - Detail info
                            HStack {
                                Text("Number of words: 23")
                                    .font(.callout)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                if level == "None" {
                                    HStack {
                                        Text("Level: ")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                        Text("None")
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.subheadline)
                                    }
                                    
                                } else {
                                    HStack {
                                        Text("Level: ")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                        Text(level)
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.subheadline)
                                    }
                                }
                            }
                            .frame(alignment: .trailing)
                        }
                        .padding()
                        // end of VStack
                    }
                    .background(BlurView(style: .regular))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                    .frame(height: 110)
                    .padding(.horizontal)
                    //
                    
                    Spacer()
                    
                    // MARK: - TextFields
                    ZStack {
                        TextField("Name of a group..", text: $name)
                            .foregroundColor(.white)
                            .contentShape(Rectangle())
                            // .cornerRadius(10)
                            // .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                            .lineLimit(1)
                            .font(.system(size: 18))
                            .frame(width: UIScreen.main.bounds.width - 80)
                            .frame(height: 75)
                            .padding(.horizontal)
                            // .background(BlurView(style: .regular))
                    }
                    .background(BlurView(style: .regular))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                    .frame(height: 85)
                    .padding(.horizontal)
                    
                    ZStack {
                        TextField("Type some notes (optional)", text: $note)
                            .foregroundColor(.white)
                            .contentShape(Rectangle())
                            // .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                            .lineLimit(1)
                            .font(.system(size: 18))
                            .frame(width: UIScreen.main.bounds.width - 80)
                            .frame(height: 75)
                            // .cornerRadius(10)
                            .padding(.horizontal)
                            // .background(BlurView(style: .regular))
                    }
                    .background(BlurView(style: .regular))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    //.padding(.horizontal)

                    // MARK: - Section
                    
//                    Section {
                        Picker("Select the level", selection: $level) {
                            ForEach(levels, id: \.self) {
                                Text($0)
                            }
                        }
                        .font(.system(size: 18))
                        .background(BlurView(style: .regular))
                        .foregroundColor(.white)
                        .padding()
                        .pickerStyle(MenuPickerStyle())
                        
                        .frame(height: 19)
//                    }
                    
                    // MARK: - Button
                    
                    Button(action: {
                        // createGroup()
                    }) {
                        if name.count > 0 {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                                Text("Create")
                                    .foregroundColor(.white)
                                    .font(.callout)
                            }
                            .padding()
                        } else {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                Text("Create")
                                    .foregroundColor(.white)
                                    .font(.callout)
                            }
                            .padding()
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 80, height: 90)
                    .buttonStyle(AnimatedButton())
                    // end of the button
                    Spacer()
                }
                // end of inner VStack
                
                Spacer()
            }
            .background(Image("first").scaledToFill())
            // end of outer VStack
            // .navigationTitle("Create a group")
        }
        // end of NavigationView
    }
}

struct AddNewGroup_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGroup()
    }
}
