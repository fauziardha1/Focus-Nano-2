//
//  TaskModelExtensions.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 27/07/22.
//

import Foundation
import CoreData

extension Task : BaseModel{
    static var all : NSFetchRequest<Task> {
        let request = Task.fetchRequest()
        request.sortDescriptors = []
        return request 
    }
}
 
