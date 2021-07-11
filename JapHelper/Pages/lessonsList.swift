//
//  lessonsList.swift
//  JapHelper
//
//  Created by Kovs on 08.11.2020.
//

import SwiftUI

struct lessonsList: View {
    @EnvironmentObject var userData: UserData
    
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

