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
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 25)
                                                        .fill(Color.red)
                                                        .frame(width: 210, height: 230)
                                                        .padding(10)
                                                    Image(systemName: "books.vertical")
                                                        .font(.system(size: 75))
                                                        .foregroundColor(.white)
                                                }
                                               })
                                
                                VStack {
                                    // upper rectangle:
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.blue)
                                            .frame(width: 100, height: 100)
                                            .padding(.vertical, 5)
                                        Image(systemName: "camera")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                    }
                                    // lower rectangle
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.black)
                                            .frame(width: 100, height: 100)
                                        Image(systemName: "list.bullet.below.rectangle")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            
                        }
                        
                        // end of rectangles
                        
                        VocabularyAdd()
                    }
                }
                // end of ScrollView
                
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
