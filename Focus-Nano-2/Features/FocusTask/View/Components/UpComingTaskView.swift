//
//  UpComingTaskView.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

struct UpComingViewList: View {
    let g : GeometryProxy
    @Binding var isGoToHistorypage : Bool
    @ObservedObject var focusTasksViewModel : FocusTaskViewModel
    let deleteTask : (_ offsets : IndexSet)->Void
    
    var body: some View {
        List {
            Section(header:Text("Upcoming Task"), footer: ListFooter(width: g.size.width, isGoToHistoryPage: $isGoToHistorypage)) {
                
                if (!focusTasksViewModel.tasks.isEmpty && focusTasksViewModel.tasks.count > 1) {
                    ForEach(focusTasksViewModel.tasks[1..<focusTasksViewModel.tasks.count]){ task in
                        HStack {
                            let title = task.title
                            let day = task.dueDate.getDayStr()
                            let hour = task.dueDate.getTimeStr()
                            
                            Text(title).font(.body)
                            Spacer()
                            Text(day+", "+hour)
                                .font(.subheadline)
                                .foregroundColor(.black.opacity(0.5))
                        }
                    }.onDelete(perform: deleteTask)
                }
            }
            
        }
    }
}
