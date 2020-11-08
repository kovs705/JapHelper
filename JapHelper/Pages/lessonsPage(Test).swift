   
   // OBJECTS IN JSON:
   
    /*
     name
        info:
            level
            text
            additionalInfo
     end
     */

import SwiftUI
   // MARK: - Instructions
    /// INFO: test DetailView to see the first example of how the lessons page should look like
    /// DETAILS: on a page should be: Image, title, text, examples, additional infos or links to another lessons (next or previous)
    /// TODO: make the first concept, make decisions with color scheme, text fonts and UI/UX
    /// COLORS: #1c2e4a - Navy Blue, red - rgb(255, 0, 0), or rgb(128, 0, 0), olive green - #556B2F, dark wood color - #855e42, off-white - F5F5F5
    /// SIZES: should be 17pt for text, 34pt before scrolling for title and so on...
   
// MARK: - DeatilView struct
struct lessonsPage_Test_: View {
    var lesson: Lesson
    
    var body: some View {
        ScrollView {
            
            // MARK: - Image Header:
            GeometryReader { geometry in
                // Image(lesson)
                // LOAD THE IMAGE HERE!!!
            }
            
            
            // level and something else (like a date)
            // MARK: - Top level
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Level:")
                        .font(.custom("AvenirNext-Demibold", size: 15))
                        .padding(.leading)
                    
                    Text(lesson.info.level.rawValue)
                        .font(.custom("AvenirNext-Bold", size: 15))
                        //.fontWeight(.black)
                    Spacer()
                }
                .padding(.top, 20)
                
                // MARK: - Title
                Text(lesson.name)
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .lineLimit(nil)
                    .padding(.top, 10)
                
                Text(lesson.info.text)
                    .font(.system(size: 20))
                    .lineLimit(nil)
                    .padding(.top, 30)
                
            }
            .padding(.horizontal)
        }
    }
}

struct lessonsPage_Test__Previews: PreviewProvider {
    static var previews: some View {
        lessonsPage_Test_(lesson: lessonsData[0])
    }
}
