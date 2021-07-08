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
    
    private init() {
        
    }
    
    func save(search: SearchObject) {
        let context = self.persistentContainer.viewContext
        let model = NSEntityDescription.insertNewObject(forEntityName: "QueryHistory", into: context) as! QueryHistory
        model.query = search.query
        model.timeStamp = search.timeStamp
        
        try? context.save()
    }
    
    func loadAllSearches(search: String) -> [SearchObject] {
        let context = self.persistentContainer.viewContext
        let featchRequest: NSFetchRequest = QueryHistory.fetchRequest()
        featchRequest.sortDescriptors = [NSSortDescriptor(key: "timeStamp", ascending: false)]
        do {
            let result = try context.fetch(featchRequest)
            let values: [SearchObject]
            if search != "" {
                values = result.map({SearchObject(query: $0.query, timeStamp: $0.timeStamp)}).filter({$0.query.lowercased().contains(search.lowercased())})
            } else {
                values = result.map({SearchObject(query: $0.query, timeStamp: $0.timeStamp)})
            }
            
             return values
        } catch {
            return []
        }
    }
}
