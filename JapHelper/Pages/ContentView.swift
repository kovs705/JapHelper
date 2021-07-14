//
//  ContentView.swift
//  JapHelper
//
//  Created by Kovs on 19.10.2020.
//

import SwiftUI
import CoreData
import Combine


  
struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Group.entity(), sortDescriptors: [], animation: .default)
    var groups: FetchedResults<Group>
    @EnvironmentObject var userData: UserData
    
    @State private var visible: Bool = false
    @State private var keyboardHeight: CGFloat = 0
    @State var groupName: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack {
                        // Vstack with RoundedRectangles:
                        VStack {
                            HStack {
                                NavigationLink(destination: lessonsList()
                                                .environmentObject(UserData()),
                                               label: {
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 25)
                                                        .fill(Color.red)
                                                        .frame(width: 210, height: 230)
                                                        .padding(10)
                                                    Image(systemName: "books.vertical")
                                                        .font(.system(size: 75))
                                                        .foregroundColor(.white)
                                                }
                                               })
                                
                                VStack {
                                    // upper rectangle:
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.blue)
                                            .frame(width: 100, height: 100)
                                            .padding(.vertical, 5)
                                        Image(systemName: "camera")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                    }
                                    // lower rectangle
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.black)
                                            .frame(width: 100, height: 100)
                                        Image(systemName: "list.bullet.below.rectangle")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            
                        }
                        
                        // end of rectangles
                        
                        VStack {
                            HStack {
                                Text("Vocabulary")
                                    .font(.system(size: 23))
                                    .bold()
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            if visible {
                                    TextField("Group name..", text: $groupName)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        
                                        .padding(.horizontal)
                                        .padding(.bottom, keyboardHeight)
                                        .onReceive(Publishers.keyboardHeight) {
                                            self.keyboardHeight = $0
                                        }
                                        
                                        .transition(.asymmetric(insertion: .move(edge: .top).combined(with: .opacity), removal: .opacity))
                                        .frame(height: 100)
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
                // end of ScrollView
                
                // floating button:
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        AddGroupButton(visible: $visible)
                    }
                }
                .padding()
                .navigationTitle("Japanese")
            }
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(UserData())
    }
}

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
