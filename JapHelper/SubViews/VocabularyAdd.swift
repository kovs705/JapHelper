//
//  VocabularyAdd.swift
//  JapHelper
//
//  Created by Kovs on 19.10.2020.
//

// TODO: Create a sheet to add a new group with the button on dismiss
// TODO: Add a DetailView to check each groups words inside

import CoreData
import Combine
import SwiftUI


struct VocabularyAdd: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Group.entity(), sortDescriptors: [], animation: .default)
    var groups: FetchedResults<Group>
    
    // @State private var keyboardHeight: CGFloat = 0
    
    // @State var groupName: String = ""
    
    // @State private var visible = false
    // @EnvironmentObject var visible: VisibleToggle
    
    // TODO: quick list of your vocabulary + abbility to create the new list
    var body: some View {
        Text("Delete this")
    }
}

struct VocabularyAdd_Previews: PreviewProvider {
    static var previews: some View {
        VocabularyAdd()
    }
}




