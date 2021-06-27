//
//  listAdd.swift
//  JapHelper
//
//  Created by Kovs on 22.01.2021.
//

import SwiftUI

struct listAdd: View {
    
    // Sheet with the TextField on top
    // then, when the user types his hyeroglyphic, the tableView under the TextField
    // will show results or recommendations
    
    @State private var name: String = ""
    
    var body: some View {
        ZStack {
            TextField("List name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .lineLimit(2)
                .padding(.horizontal)
        }
    }
}

struct listAdd_Previews: PreviewProvider {
    static var previews: some View {
        listAdd()
    }
}
