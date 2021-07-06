//
//  DatabaseUtil.swift
//  Star Wars
//
//  Created by Vinicius Emanuel on 06/07/21.
//

import Foundation
import CoreData

class DatabaseUtil {
    static let shared = DatabaseUtil()
    
    private lazy var persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "StarWars")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
        
        return container
    }()
    
    private func saveContext() {
        let context = self.persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    private init() {
        
    }
}
