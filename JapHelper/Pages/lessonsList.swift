//
//  lessonsList.swift
//  JapHelper
//
//  Created by Kovs on 08.11.2020.
//

import SwiftUI
import CoreData
import Combine
import UIKit

// MARK: - Instructions
    /// so this lessons list should be divided in parts by language levels from N5 to N1
    /// title of levels should be noticable and big, 34pt
    /// favorite lessons should be marked with a star or a heart on the right side
    ///
//

struct lessonsList: View {
    @EnvironmentObject var userData: UserData
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var groupName: String = ""
    @State private var keyboardHeight: CGFloat = 0
    
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
    
    var body: some View {
        List {
            ForEach(userData.lessons) { lesson in
                NavigationLink(destination: lessonsPage_Test_(lesson: lesson)
                                .environmentObject(UserData())) {
                    lessonRow(lesson: lesson)
                }
                .padding(.horizontal)
            }
        }
        
        
        
        TextField("Group name..", text: $groupName, onCommit: {
            // gav
        })
        
        // .transition(.asymmetric(insertion: .move(edge: .top).combined(with: .opacity), removal: .opacity))
        //.frame(width: UIScreen.main.bounds.width - 80, height: 55)
        //.contentShape(Rectangle())
        // .padding(.horizontal)
        .background(Color.black)
        .cornerRadius(20)
        
        // .lineLimit(1)
        // .scaleEffect(self.buttonState ? 0.95 : 1.0)
        
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
        // .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
        // .transition(.asymmetric(insertion: .move(edge: .top).combined(with: .opacity), removal: .opacity))
        // .frame(height: 50)
        // focus keyboard on click
        .navigationTitle("Lessons list")
        .listStyle(GroupedListStyle())
    }
    // end of List
}

struct lessonsList_Previews: PreviewProvider {
    static var previews: some View {
        lessonsList()
            .environmentObject(UserData())
    }
}


