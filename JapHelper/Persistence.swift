//
//  Persistence.swift
//  JapHelper
//
//  Created by Kovs on 19.10.2020.
//
import SwiftUI
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    @Environment(\.managedObjectContext) private var viewContext

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        // MARK: - Creating an object:
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Creating the Group:
            let group = Group(context: viewContext)
            // Creating a Word:
            let word = Word(context: viewContext)
            
            // Configure Word:
            word.exactWord = "テスト"
            word.translation = "Test"
            return true
        }
        
        do {
            try viewContext.save()
        } catch {
            
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "JapHelper")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

