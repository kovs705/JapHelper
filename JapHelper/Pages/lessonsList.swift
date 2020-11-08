//
//  lessonsList.swift
//  JapHelper
//
//  Created by Kovs on 08.11.2020.
//

import SwiftUI

struct lessonsList: View {
    
    var lesson: Lesson
    
    var body: some View {
        NavigationView {
            List(lessonsData) { lesson in
                NavigationLink(destination: lessonsPage_Test_(lesson: lesson)) {
                    lessonRow(lesson: lesson)
                }
            }
            .navigationTitle("Lessons list")
        }
    }
}

struct lessonsList_Previews: PreviewProvider {
    static var previews: some View {
        lessonsList(lesson: lessonsData[0])
    }
}
