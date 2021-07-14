//
//  GroupView.swift
//  JapHelper
//
//  Created by Kovs on 14.07.2021.
//
// a view, where user can look on his word list, do some changes and delete the group

import CoreData
import SwiftUI

struct GroupView: View {
    
    let group: Group
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    
    var body: some View {
        Text("Hello world!")
        // create an HStack with the big hyeroglyphic and the translation on the right side in a whole list
    }
}

struct GroupView_Previews: PreviewProvider {
    static let viewContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let group = Group(context: viewContext)
        group.name = "Test Name"
        
        return NavigationView {
            GroupView(group: group)
        }
    }
}
