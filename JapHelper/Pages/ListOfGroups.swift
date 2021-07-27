//
//  ListOfGroups.swift
//  JapHelper
//
//  Created by Kovs on 22.07.2021.
//

import SwiftUI

struct ListOfGroups: View {
    
    @FetchRequest(entity: Group.entity(), sortDescriptors: [], animation: .default)
    var groups: FetchedResults<Group>
    
    
    var body: some View {
        ScrollView {
            VStack {
                List {
                    ForEach(groups, id: \.self) { group in
                        Section(header: Text(group.wrappedName)) {
                            ForEach(group.wordsArray, id: \.self) { word in
                                Text(word.wrappedExactWord)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ListOfGroups_Previews: PreviewProvider {
    static var previews: some View {
        ListOfGroups().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(UserData())
    }
}
