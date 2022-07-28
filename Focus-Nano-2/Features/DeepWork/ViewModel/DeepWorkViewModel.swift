//
//  DeepWorkViewModel.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import CoreData

class DeepWorkViewModel : ObservableObject {
    
    var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    // update a task
    func updateTask(task: TaskViewModel,  status : Bool){
        do{
            guard let task = try context.existingObject(with: task.id) as? Task else{
                return
            }
            
            task.is_done = true
           try task.save()
            
        }catch {
            debugPrint(error)
        }
    }
}
