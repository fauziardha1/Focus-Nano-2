//
//  TaskViewModel.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import CoreData

class TaskViewModel : Identifiable{
    private var task : Task
    
    init(task: Task) {
        self.task = task
    }
    
    var id : NSManagedObjectID{
        task.objectID
    }
    
    var title : String {
        task.title ?? ""
    }
    
    var dueDate : Date {
        task.due_date ?? Date.now
    }
    
    var idDone : Bool {
        task.is_done
    }
}
