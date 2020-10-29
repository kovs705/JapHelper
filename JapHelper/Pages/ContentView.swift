//
//  ContentView.swift
//  JapHelper
//
//  Created by Kovs on 19.10.2020.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Group.entity(), sortDescriptors: [], animation: .default)
    var groups: FetchedResults<Group>
    
    var body: some View {
        NavigationView {
            ZStack {
            ScrollView {
                VStack {
                    lastAndSearch()
                    VocabularyAdd()
                }
            }
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        testButtonAdd()
                    }
                }
                .padding()
            // end of the ScrollVIew
            .navigationTitle("Japanese")
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
