//
//  ContentView.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 25/07/22.
//

import SwiftUI

struct FocusTaskPage: View {
    @State private var isShowingCreateTaskpage = false
    @State private var isShowingDeepWorkSheet = false
    @State private var isGoToHistorypage = false
    @State var currentTask : TaskViewModel?
    
    //using as param for vm
    @Environment(\.managedObjectContext) var viewContext
    
    // initiate vm
    @ObservedObject var focusTasksViewModel : FocusTaskViewModel
    
    init(vm: FocusTaskViewModel){
        self.focusTasksViewModel = vm
        sortingTask()
        currentTask = focusTasksViewModel.tasks.first
    }
    

    var body: some View {
        let currentTaskDay = currentTask?.dueDate.getDayStr() ?? Date.now.getDayStr()
        let currentTaskHour = currentTask?.dueDate.getTimeStr() ?? Date.now.getTimeStr()
        
        ZStack {
            Color(UIColor.secondarySystemBackground).ignoresSafeArea()
            
            GeometryReader { g in
                VStack(alignment: .leading) {
                    // Navbar Top
                    FocusTaskNavBar(g: g, isShowingCreateTaskpage: $isShowingCreateTaskpage, sortingTask: sortingTask)
                    
                    // Page Title and avatar
                    PageTitleWithAva()
                    
                    // Current Task Group View
                    Group {
                        Text("Current Task".uppercased())
                            .font(.subheadline)
                            .foregroundColor(Color(UIColor.lightGray))
                            .padding(.leading, 43)
                            .padding(.bottom, -4)
                    
                        // Current Task HighLight Card
                        CurrentTaskHighlight(g: g, focusTasksViewModel: focusTasksViewModel, currentTaskDay: currentTaskDay, currentTaskHour: currentTaskHour)
                            
                        // Start Deep Work Button
                        StartDeepWorkButton(g: g, isShowingDeepWorkSheet: $isShowingDeepWorkSheet, currentTask: focusTasksViewModel.tasks.first, isTasksEmpty: focusTasksViewModel.tasks.isEmpty)
                    }
                    
                    // List for UpComing Task
                    UpComingViewList(g: g, isGoToHistorypage: $isGoToHistorypage, focusTasksViewModel: focusTasksViewModel, deleteTask: deleteTask)

                    Spacer()
                    
                }
            }
        }
        .navigate(to: HistoryPage(), when: $isGoToHistorypage)
        
    }
    
    func sortingTask()  {
        if !focusTasksViewModel.tasks.isEmpty {
            for index in 0..<focusTasksViewModel.tasks.count-1 {
                for secIndex in 1..<focusTasksViewModel.tasks.count{
                    
                    if focusTasksViewModel.tasks[index].dueDate.timeIntervalSince1970 > focusTasksViewModel.tasks[secIndex].dueDate.timeIntervalSince1970{
                        
                        let temp : TaskViewModel = focusTasksViewModel.tasks[index]
                        focusTasksViewModel.tasks[index] = focusTasksViewModel.tasks[secIndex]
                        focusTasksViewModel.tasks[secIndex] = temp
                        
                    }
                }
            }
            
            for task in focusTasksViewModel.tasks {
                debugPrint(task.dueDate)
            }
        }
    }
    
    private func deleteTask(at offsets : IndexSet){
        offsets.forEach{
            index in
            let task = focusTasksViewModel.tasks[index]
            focusTasksViewModel.deleteTask(taskID: task.id)
        }
    }
    
}
    

struct FocusTaskPage_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistanceContainer.viewContext
        FocusTaskPage(vm: FocusTaskViewModel(context: viewContext))
            .previewInterfaceOrientation(.portrait)
    }
}
