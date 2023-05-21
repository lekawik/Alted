//
//  PeristentContainer.swift
//  Alted
//
//  Created by Soren SAMAMA on 21/05/2023.
//

import CoreData

class PersistentContainer {
    static let shared = PersistentContainer()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Alted")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    private init() {}
    
    func saveContext() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
