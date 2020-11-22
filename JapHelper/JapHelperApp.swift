//
//  JapHelperApp.swift
//  JapHelper
//
//  Created by Kovs on 19.10.2020.
//

import SwiftUI
import UIKit

@main
struct JapHelperApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //lessonsList().environmentObject(UserData())
            ContentView()
                //.environmentObject(UserData())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
