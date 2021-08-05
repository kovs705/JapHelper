//
//  lessonsPage2.swift
//  JapHelper
//
//  Created by Kovs on 31.07.2021.
//

import SwiftUI

struct lessonsPage2: View {
    
    @EnvironmentObject var userData: UserData
    var lesson: Lesson
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            
            // MARK: - Image Header:
            GeometryReader { geometry in
                VStack {
                    // if we didn't scroll or went downwards anyway:
                    if geometry.frame(in: .global).minY <= 0 {
                        lesson.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(y: geometry.frame(in: .global).minY/25)
                            .clipped()
                    } else {
                        // if we scrolled over the top:
                        lesson.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            // adding the current minY value of our ScrollView’s GeometryReader to the height of our Image’s .frame modifier:
                            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                            .clipped()
                            .offset(y: -geometry.frame(in: .global).minY)
                    }
                }
            }
            .frame(height: 400)
        }
    }
}

struct lessonsPage2_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return lessonsPage2(lesson: userData.lessons[0])
            .environmentObject(userData)
    }
}
