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
    
    @EnvironmentObject var userData: UserData
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var show = false
    
    func add() {
        let newWord = Group(context: self.viewContext)
        newWord.words = [String("Hello")]
        do {
            try self.viewContext.save()
        } catch {
            print("Failed to create a word for a group!")
        }
        
        try? self.viewContext.save()
    }
    
    var body: some View {
        //        /*
        ScrollView {
            VStack {
                List {
                    ForEach(groups, id: \.self) { group in
                        Section(header: Text(group.name ?? "Unknown group name")) {
                            ForEach(group.wordsArray, id: \.self) { word in
                                NavigationLink(destination: GroupDetailView(group: group, word: word), label: {
                                    Text(word.wrappedExactWord)
                                })
                                
                                // Text(word.wrappedExactWord)
                            }
                        }
                    }
                    
                }
            }
        }
        // end of ScrollView
        .navigationBarItems(trailing: Button(action: {
            self.show.toggle()
        }) {
            Image(systemName: "plus")
                .font(.system(size: 25))
        }).sheet(isPresented: $show) {
            AddNewGroup()
        }
    }
}

struct ListOfGroups_Previews: PreviewProvider {
    static var previews: some View {
        ListOfGroups().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(UserData())
    }
}
