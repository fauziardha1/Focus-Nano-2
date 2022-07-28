//
//  FocusTaskViewModel.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 26/07/22.
//

import Foundation
import SwiftUI
import CoreData

class FocusTaskViewModel : NSObject, ObservableObject {
    
    @Published var tasks = [TaskViewModel]()
    
    private let fetchResultController : NSFetchedResultsController<Task>
    private (set) var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
        
        self.fetchResultController = NSFetchedResultsController(fetchRequest: Task.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchResultController.delegate = self
        
        do {
            try fetchResultController.performFetch()
            guard let tasks = fetchResultController.fetchedObjects else {
                return
            }
            self.tasks = tasks.map(TaskViewModel.init)
        } catch {
            debugPrint(error)
        }
        
        self.tasks = self.tasks.sorted(by: {$0.dueDate.compare($1.dueDate) == .orderedAscending})
    }
    
    func deleteTask(taskID : NSManagedObjectID)  {
        do{
            guard let task = try context.existingObject(with: taskID) as? Task else{
                return
            }
            
            try task.delete()
            
        }catch {
            debugPrint(error)
        }
    }
    
    
}

extension FocusTaskViewModel : NSFetchedResultsControllerDelegate{
    func controllerDidChangeContent(_ controller : NSFetchedResultsController<NSFetchRequestResult>) {
        guard let tasks  = controller.fetchedObjects as? [Task] else{
            return
        }
        
        self.tasks = tasks.map(TaskViewModel.init)
    }
}
