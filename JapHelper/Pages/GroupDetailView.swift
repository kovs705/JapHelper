//
//  GroupDetailView.swift
//  JapHelper
//
//  Created by Kovs on 27.07.2021.
//

import SwiftUI
import CoreData

struct GroupDetailView: View {
    
    let group: Group
    let word: Word
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // list of words here
                         
                }
                .navigationTitle(group.name ?? "No name")
                
                // Sheet view and then two horizontal blocks-islands, where user can write his
                // hieroglyphic and downwards write the translation
                // green button to create a new word for the group.
                
            }
            .navigationTitle(group.name ?? "Unknown group name")
        }
        // end of NavView
    }
}

struct GroupDetailView_Previews: PreviewProvider {
    
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        
        let word = Word(context: moc)
        let group = Group(context: moc)
        group.name = "Test Name"
        word.exactWord = "Exact Word"
        word.translation = "Translation"
        
        return NavigationView {
            GroupDetailView(group: group, word: word)
        }
    }
}
