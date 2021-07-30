//
//  testButtonAdd.swift
//  JapHelper
//
//  Created by Kovs on 29.10.2020.
//

import SwiftUI

class VisibleToggle: ObservableObject {
    @Published var visible: Bool = false
}

struct AddGroupButton: View {
    
    @Binding var visible: Bool
    
    var body: some View {
        Button(action: toggleIt) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                HStack {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                    Text("Add group")
                        .foregroundColor(.white)
                        .bold()
                        .lineLimit(0)
                }
            }
            .frame(width: 140, height: 45)
        }
    }
    
    func toggleIt() {
        visible.toggle()
    }
}

struct testButtonAdd_Previews: PreviewProvider {
    
    @State private var visible: Bool = false
    
    static var previews: some View {
        AddGroupButton(visible: .constant(false))
    }
}


