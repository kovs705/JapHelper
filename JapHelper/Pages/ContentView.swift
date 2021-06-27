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
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack {
                        // Vstack with RoundedRectangles:
                        VStack {
                            HStack {
                                NavigationLink(destination: lessonsList()
                                                .environmentObject(UserData()),
                                               label: {
                                                RoundedRectangle(cornerRadius: 25)
                                                    .fill(Color.red)
                                                    .frame(width: 210, height: 240)
                                                    .padding(10)
                                               })
                                
                                VStack {
                                    // upper rectangle:
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.blue)
                                        .frame(width: 100, height: 110)
                                        .padding(.vertical, 5)
                                    // lower rectangle
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.black)
                                        .frame(width: 100, height: 110)
                                }
                            }
                            
                        }
                        
                        VocabularyAdd()
                    }
                }
                // floating button:
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        testButtonAdd()
                    }
                }
                .padding()
                .navigationTitle("Japanese")
            }
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(UserData())
    }
}
