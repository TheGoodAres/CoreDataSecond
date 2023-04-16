//
//  DataController.swift
//  CoreDataSecond
//
//  Created by Robert-Dumitru Oprea on 15/04/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataSecond")
    
    init() {
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
                return
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
            
        }
    }
}
