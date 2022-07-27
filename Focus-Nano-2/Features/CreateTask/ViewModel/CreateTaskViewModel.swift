//
//  CreateTaskViewModel.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 27/07/22.
//

import Foundation
import CoreData


class CreateTaskViewModel : ObservableObject {
    
    @Published var title : String = ""
    @Published var dueDate : Date = Date.now 
    
    var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    func save()  {
        do{
            let task = Task(context: context)
            task.title = title
            task.id = UUID()
            task.is_done = false
            task.due_date = dueDate
            task.resource = ""
            
            try task.save()
        } catch{
            print(error)
        }
    }
}
