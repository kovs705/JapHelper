//
//  testButtonAdd.swift
//  JapHelper
//
//  Created by Kovs on 29.10.2020.
//

import SwiftUI

struct testButtonAdd: View {
    var body: some View {
        Button(action: add) {
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
    
    func add() {
        print("Hello")
    }
}

struct testButtonAdd_Previews: PreviewProvider {
    static var previews: some View {
        testButtonAdd()
    }
}
