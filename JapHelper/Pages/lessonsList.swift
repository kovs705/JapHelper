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

    
    // MARK: - Functions

    func add() {
        let newGroup = Group(context: self.viewContext)
        newGroup.name = self.groupName
        
        try? self.viewContext.save()
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
            .onAppear {
                UITableView.appearance().isScrollEnabled = true
            }
            .listStyle(GroupedListStyle())
        // .padding(.horizontal)
        .navigationTitle("Lessons list")

    }
    // end of List
}

struct lessonsList_Previews: PreviewProvider {
    static var previews: some View {
        lessonsList()
            .environmentObject(UserData())
    }
}


