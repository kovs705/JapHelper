   
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
    var lessons: Lesson
    
    var body: some View {
        VStack {
            // Title of the lesson:
            HStack {
                Text(lessons.name)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Spacer()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.offWhite)
                Text(lessons.info.text)
                    .font(.system(size: 17))
            }
            ZStack {
                List {
                    Text("Hello, put here some examples or think about HStack with objects..")
                }
            }
        }
    }
}

struct lessonsPage_Test__Previews: PreviewProvider {
    static var previews: some View {
        lessonsPage_Test_(lessons: lessonsData[0])
    }
}
