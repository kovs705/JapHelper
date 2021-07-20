//
//  ContentView.swift
//  JapHelper
//
//  Created by Kovs on 19.10.2020.
//

import SwiftUI
import CoreData
import Combine
import UIKit

// MARK: - Instructions
    ///
    ///
    ///
//


// MARK: - ContentView struct
struct ContentView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Group.entity(), sortDescriptors: [], animation: .default)
    var groups: FetchedResults<Group>
    @EnvironmentObject var userData: UserData
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var visible: Bool = false
    @State private var keyboardHeight: CGFloat = 0
    @State var groupName: String = ""
    
    @State private var buttonState: Bool = false
    
    // MARK: - Functions

    func add() {
        let newGroup = Group(context: self.viewContext)
        newGroup.name = self.groupName
        
        try? self.viewContext.save()
    }
    func changeToggle() {
        buttonState.toggle()
    }
    
    // MARK: - Body
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
                                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                                               })
                                // MARK: - Rectangles
                                VStack {
                                    // upper rectangles:
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.blue)
                                            .frame(width: 100, height: 100)
                                            .padding(.vertical, 5)
                                        Image(systemName: "camera")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                    }
                                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                                    // lower rectangle
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.black)
                                            .frame(width: 100, height: 100)
                                        Image(systemName: "list.bullet.below.rectangle")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                    }
                                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                                }
                            }
                            
                        }
                        
                        // end of rectangles
                        
                        // MARK: - Vocabulary
                        VStack {
                            HStack {
                                Text("Vocabulary")
                                    .font(.system(size: 23))
                                    .bold()
                                    .frame(height: 50)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            if visible {
                            
                                // ФОКУСИРОВКА НА КЛАВИАТУРУ И ИЗМЕНЕНИЕ ЦВЕТА КНОПКУ ДОБАВЛЕНИЯ ГРУППЫ
                                ZStack {
                                    // MARK: - Keyboard
                                TextField("Group name..", text: $groupName, onCommit: {
                                    // gav
                                })
                                
                                .transition(.asymmetric(insertion: .move(edge: .top).combined(with: .opacity), removal: .opacity))
                                .frame(width: UIScreen.main.bounds.width - 80, height: 55)
                                .contentShape(Rectangle())
                                .padding(.horizontal)
                                .background(Color.white)
                                .cornerRadius(20)
                                
                                .lineLimit(1)
                                .scaleEffect(self.buttonState ? 0.95 : 1.0)
                                
                                .font(.system(size: 18))
                                /*
                                .onLongPressGesture(minimumDuration: 2.5, maximumDistance: 0.1, pressing: { pressing in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        self.buttonState = pressing
                                    }
                                }, perform: {})
                                */
                                
                                .animation(.easeIn)
                                
                                // .padding(.horizontal)
                                .padding(.bottom, keyboardHeight)
                                
                                .onReceive(Publishers.keyboardHeight) {
                                    self.keyboardHeight = $0
                                }
                                
                                .padding(.horizontal)
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                                .transition(.asymmetric(insertion: .move(edge: .top).combined(with: .opacity), removal: .opacity))
                                // .frame(height: 50)
                                // focus keyboard on click
                                }
                                .zIndex(-1)
                            }
                            
                            // MARK: - List of groups
                            
                            List {
                                HStack {
                                    Text("Unknown name")
                                        .font(.headline)
                                }
                                ForEach(groups, id: \.self) { group in
                                    HStack {
                                        Text(group.name ?? "Unknown name")
                                            .font(.headline)
                                    }
                                }
                            }
                            .background(Color.offWhite)
                            // end of the list
                            .padding()
                        }
                    }
                }
                // end of ScrollView
                
                // MARK: - Floating Button
                // floating button:
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        if !visible {
                            AddGroupButton(visible: $visible)
                        } else {
                            Button(action: add) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.redColor)
                                    HStack {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.white)
                                        Text("Add group")
                                            .foregroundColor(.white)
                                            .bold()
                                            .lineLimit(0)
                                    }
                                }
                                .frame(width: 140, height: 45)
                            }
                        }
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


// MARK: - Extensions

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
