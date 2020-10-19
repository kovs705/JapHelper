//
//  JapHelperApp.swift
//  JapHelper
//
//  Created by Kovs on 19.10.2020.
//

import SwiftUI

@main
struct JapHelperApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
