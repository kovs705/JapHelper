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

// MARK: - Garbage

/*
if notificationIsActive {
ZStack {
    RoundedRectangle(cornerRadius: 25)
        .fill(Color.white)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
        .frame(width:UIScreen.main.bounds.width - 65, height: 55)
    
    HStack {
        // Two textes with attention
        Text("Attention!")
            .font(.system(.subheadline))
            .bold()
        // Spacer()
        Text("\(attentionText)")
            .font(.system(.caption2))
            .lineLimit(2)
    }
    .frame(width:UIScreen.main.bounds.width - 80, height: 55)
}
.padding(.horizontal)
.transition(.asymmetric(insertion: .move(edge: .top).combined(with: .opacity), removal: .move(edge: .bottom).combined(with: .opacity)))
.animation(.easeInOut)
.frame(width:UIScreen.main.bounds.width - 65, height: 55)

.onReceive(timer) { time in
    if self.timeRemaining > 0 {
        self.timeRemaining -= 1
    }
    if self.timeRemaining == 0 {
        notificationIsActive = false
    }
}
}
*/
