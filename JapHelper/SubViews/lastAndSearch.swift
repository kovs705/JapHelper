//
//  lastAndSearch.swift
//  JapHelper
//
//  Created by Kovs on 19.10.2020.
//

import SwiftUI

struct lastAndSearch: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.red)
                    .frame(width: 200, height: 240)
                    .padding()
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                        .frame(width: 90, height: 90)
                        .padding(.vertical)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black)
                        .frame(width: 90, height: 90)
                }
            }
        }
    }
}

struct lastAndSearch_Previews: PreviewProvider {
    static var previews: some View {
        lastAndSearch()
    }
}
