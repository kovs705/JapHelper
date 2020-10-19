//
//  VocabularyAdd.swift
//  JapHelper
//
//  Created by Kovs on 19.10.2020.
//

import SwiftUI

struct VocabularyAdd: View {
    
    let quickList = ["Adjectives", "Verbs", "Nouns"]
    
    // quick list of your vocabulary + abbility to create the new list (or group)
    var body: some View {
        VStack {
            HStack {
                Text("Vocabulary")
                    .font(.system(size: 23))
                
                Spacer()
                
                Button(action: {
                    // create a list with alert:
                    
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.red)
                }
            }
            .padding()
            // end of HStack
            List {
                ForEach(quickList, id: (\.self)) { item in
                    HStack {
                        Text("\(item.description)")
                        
                    }
                }
            }
        }
    }
}

struct VocabularyAdd_Previews: PreviewProvider {
    static var previews: some View {
        VocabularyAdd()
    }
}
