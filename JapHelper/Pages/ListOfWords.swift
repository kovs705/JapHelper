//
//  ListOfWords.swift
//  JapHelper
//
//  Created by Kovs on 21.10.2020.
//

import SwiftUI

struct ListOfWords: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentation
    
    @FetchRequest(entity: Group.entity(), sortDescriptors: [], animation: .default)
    var groups: FetchedResults<Group>
    
    var body: some View {
        VStack {
            List {
                ForEach(groups, id: \.self) { group in
                    Section(header: Text(group.wrappedName)) {
                        ForEach(group.groupArray, id: \.self) { word in
                            Text(word.wrappedExactWord)
                        }
                    }
                }
            }
        }
    }
}



struct ListOfWords_Previews: PreviewProvider {
    static var previews: some View {
        ListOfWords()
    }
}
