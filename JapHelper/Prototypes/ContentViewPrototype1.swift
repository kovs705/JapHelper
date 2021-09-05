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
    
    //MARK: - half black or dark theme / new design with neon lights under buttons and so on (you have pictures on your phone)
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - Background
                LinearGradient(gradient: Gradient(colors: [Color.darkBlue, Color.darkGold]), startPoint: .top, endPoint: .bottom)
                VStack {
                    ZStack {
                    // MARK: - Top rounded rectangle with statistics and settings
                    RoundedRectangle(cornerRadius: 18)
                        .frame(width: UIScreen.main.bounds.width - 35, height: 190, alignment: .top)
                        .background(BlurView(style: .regular))
                        
                    }
                    .frame(width: UIScreen.main.bounds.width - 55, height: 200, alignment: .top)
                    
                }
                
            }
            .ignoresSafeArea(.all)
        }
    }
}

extension Color {
    public static var darkBlue: Color {
        return Color(red: 28 / 255, green: 46 / 255, blue: 74 / 255)
    }
    public static var darkGold: Color {
        return Color(red: 133 / 255, green: 94 / 255, blue: 60 / 255)
    }
}

struct ContentViewPrototype1_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewPrototype1()
    }
}
