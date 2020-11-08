//
//  lessonRow.swift
//  JapHelper
//
//  Created by Kovs on 08.11.2020.
//

import SwiftUI

struct lessonRow: View {
    
    var lesson: Lesson
    
    var body: some View {
        HStack {
            if lesson.image == nil {
                lessonsData[0].image
                    .resizable()
                    .frame(width: 50, height: 50)
            } else {
                lesson.image
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            Text(lesson.name)
                .lineLimit(0)
            Spacer()
        }
    }
}

struct lessonRow_Previews: PreviewProvider {
    static var previews: some View {
        lessonRow(lesson: lessonsData[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
