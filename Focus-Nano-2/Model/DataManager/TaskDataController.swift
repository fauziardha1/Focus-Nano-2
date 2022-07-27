//
//  TaskDataController.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 26/07/22.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistanceContainer : NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init(){
        persistanceContainer = NSPersistentContainer(name: "Task")
        persistanceContainer.loadPersistentStores{ description, error in
            if let error = error {
                fatalError("Error Bro, Unable to Initialize CoreData, \(error.localizedDescription)")
            }
        }
    }
}
