   
   // OBJECTS IN JSON:
   
    /*
     name
        info:
            level
            text
            additionalInfo
     end
     */
   
   // EXAMPLES IN JSON
   
   /*
    "examples": {
        "first": {
            "word": "Hello",
            "translation": "こんにちは"
        },
        "second": {
            "word": "see you!",
            "translation": "またね!"
        }
    }
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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var buttonBack: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left.circle.fill")
                .font(.system(size: 25))
                .foregroundColor(.red)
        }
    }
    
    var body: some View {
        // ZStack {
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
            
            
            // level and something else (like a date)
            // MARK: - Top level
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Level:")
                        .font(.custom("AvenirNext-Demibold", size: 15))
                        .padding(.leading)
                    
                    Text(lesson.info.level.rawValue)
                        .font(.custom("AvenirNext-Bold", size: 15))
                    Spacer()
                }
                .padding(.top, 20)
                
                // MARK: - Title
                Text(lesson.name)
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .lineLimit(nil)
                    .padding(.top, 10)
                
                // MARK: - Text
                Text(lesson.info.text)
                    .font(.system(size: 20))
                    .lineLimit(nil)
                    .padding(.top, 30)
                    //.fixedSize(horizontal: false, vertical: true)
                
                // MARK: - Example List
                List {
                    // first object:
                    HStack {
                        Text(lesson.examples.first.word)
                        Spacer()
                        Text(lesson.examples.first.translation)
                    }
                    .padding(.horizontal)
                    // second object:
                    HStack {
                        Text(lesson.examples.second.word)
                        Spacer()
                        Text(lesson.examples.second.translation)
                    }
                    .padding(.horizontal)
                }
                .frame(height: 100)
            }
            .padding(.horizontal)
                
                
                // .navigationBarItems(leading: buttonBack)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            //.navigationBarItems(leading: buttonBack)
            .edgesIgnoringSafeArea(.top)
        // end of ScrollView
    }
}
  
   
struct listOfExamples {
    var lesson: Lesson
    
    var body: some View {
        VStack {
            List {
                // first object:
                HStack {
                    Text(lesson.examples.first.word)
                    Spacer()
                    Text(lesson.examples.first.translation)
                }
                .padding(.horizontal)
                // second object:
                HStack {
                    Text(lesson.examples.second.word)
                    Spacer()
                    Text(lesson.examples.second.translation)
                }
                .padding(.horizontal)
            }
        }
        
    }
    
   }

struct lessonsPage_Test__Previews: PreviewProvider {
    static var previews: some View {
        lessonsPage_Test_(lesson: lessonsData[0])
    }
}
