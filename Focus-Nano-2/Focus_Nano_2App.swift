//
//  Focus_Nano_2App.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 25/07/22.
//

import SwiftUI

@main
struct Focus_Nano_2App: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistanceContainer.viewContext
            FocusTaskPage(vm: FocusTaskViewModel(context: viewContext))
                .environment(\.managedObjectContext, viewContext) 
//                .environment(\.managedObjectContext, TaskDataController().container.viewContext)
        }
    }
}
