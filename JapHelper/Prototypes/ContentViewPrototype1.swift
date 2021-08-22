//
//  ContentViewPrototype1.swift
//  JapHelper
//
//  Created by Kovs on 16.08.2021.
//

import SwiftUI
import CoreData
import Combine
import UIKit

// MARK: - Instructions
    ///
    /// The second prototype of ContentView
    /// I want to add some curves for tabs + make buttons bigger and the design much brighter and fresher for users
    ///
    ///
//

struct ContentViewPrototype1: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: Group.entity(), sortDescriptors: [], animation: .default)
    var groups: FetchedResults<Group>
    
    @EnvironmentObject var userData: UserData
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    
    var body: some View {
        
        ScrollView {
            
            ZStack {
                Color.yellow
            }
            .ignoresSafeArea(.all)
            
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
            }
            .offset(y: -200)
            
        }
        //.ignoresSafeArea()
    }
}

struct ContentViewPrototype1_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewPrototype1()
            //.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            // .environmentObject(UserData())
    }
}
