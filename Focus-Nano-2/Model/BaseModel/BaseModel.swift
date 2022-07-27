//
//  BaseModel.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 27/07/22.
//

import Foundation
import CoreData


protocol BaseModel{
    static var viewContext : NSManagedObjectContext {get}
    func save() throws
    func delete() throws
}

extension BaseModel where Self:NSManagedObject{
    static var viewContext: NSManagedObjectContext{
        CoreDataManager.shared.persistanceContainer.viewContext
    }
    
    func save() throws {
        try Self.viewContext.save()
    }
    
    func delete() throws{
        Self.viewContext.delete(self)
        try save()
    }
}
