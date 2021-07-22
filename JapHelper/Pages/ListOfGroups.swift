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
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    var body: some View {
        ScrollView {
            VStack {
                List {
                    ForEach(groups, id: \.self) { group in
                        Text(group.name ?? "Unknown name")
                            .font(.headline)
                    }
                }
                .frame(height: minRowHeight * 5).border(Color.red)
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
