//
//  lessonsPage(Test).swift
//  JapHelper
//
//  Created by Kovs on 02.11.2020.
//

import SwiftUI

struct lessonsPage_Test_: View {
    var lessons: Lesson
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct lessonsPage_Test__Previews: PreviewProvider {
    static var previews: some View {
        lessonsPage_Test_(lessons: lessonsData[0])
    }
}
