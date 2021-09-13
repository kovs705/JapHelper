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
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
      @State var timeNow = ""
      let dateFormatter = DateFormatter()
    
    
    // MARK: - GREETING
    @State var greeting = ""
    
    
    
    //MARK: - half black or dark theme / new design with neon lights under buttons and so on (you have pictures on your phone)
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - Background
                LinearGradient(
                    gradient: Gradient(colors: [Color.veryDarkBlue, Color.darkBlue, Color.darkGold]),
                    startPoint: UnitPoint(x: 0.1, y: 0),
                    endPoint: .bottom
                )
                ScrollView {
                    VStack {
                        VStack {
                            Text("")
                                .onReceive(timer) { _ in
                                    self.timeNow = dateFormatter.string(from: Date())
                                }
                                .onAppear()
                        }
                        .frame(height: 200)
                        
                        
                        
                        ZStack {
                            // MARK: - Top rounded rectangle with statistics and settings
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color.clear)
                                .frame(width: UIScreen.main.bounds.width - 35, height: 190)
                                .background(BlurView(style: .regular))
                            
                        }
                        .frame(width: UIScreen.main.bounds.width - 55, height: 200)
                        
                        Spacer()
                        
                        
                    }
                    // end of VStack
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
    public static var veryDarkBlue: Color {
        return Color(red: 10 / 255, green: 20 / 255, blue: 50 / 255)
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
