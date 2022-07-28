//
//  DeepWorkSheet.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 26/07/22.
//

import SwiftUI
import CoreData

struct DeepWorkSheet: View {
    @Environment(\.dismiss) var dismiss
    @State private var taskNotes : String = "  Notes"
    @ObservedObject var deepWorkVieModel : DeepWorkViewModel
    
    // for timer
    @State private var pomodoroTimer = 25*60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // disable Dismiss
    @State private var termsAccepted = false
    
    private let taskDoing : TaskViewModel?
    
    
    init(taskDoing: TaskViewModel?, vm: DeepWorkViewModel){
        self.taskDoing = taskDoing
        self.deepWorkVieModel = vm
        
        
    }
   

    var body: some View{
        
        ZStack{
            Color.gray.opacity(0.2).ignoresSafeArea()
            
            GeometryReader{
                g in
                VStack(alignment: .leading) {
                    // Navbar Top
                    DeepWorkNavBar(g: g, termsAccepted: $termsAccepted)
                    
                    // count down
                    PomodoroTimer(currentTime: $pomodoroTimer)

                    // task title
                    Text("Task Title")
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.lightGray))
                        .padding(.leading,32)
                        .padding(.bottom, -4)
                    
                    Text(taskDoing?.title ?? "No Title Found" )
                        .frame(width: g.size.width - 48, height: 50, alignment: .leading)
                        .padding(.leading)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 32)
                        
                    
                    
                    // Due Date Section
                    Text("Due Date")
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.lightGray))
                        .padding(.leading,32)
                        .padding(.bottom, -4)
                    
                    
                    // Due Date view
                    DueDateView(g: g, taskDoing: taskDoing)
                    
                    // Due Time view
                    DueTimeView(g: g, taskDoing: taskDoing)
                    
                    
                    // Notes Section
                    Text("Notes")
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.lightGray))
                        .padding(.leading,32)
                        .padding(.bottom, -4)
                        .padding(.top)
                    
                    TextEditor( text: $taskNotes)
                        .lineLimit(5)
                        .textFieldStyle(CustomTextFieldStyle())
                        .frame(width: g.size.width - 32, height: 150, alignment: .center)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .foregroundColor(taskNotes == "  Notes" ? .gray : .black)
                  
                    VStack(alignment: .leading) {
                        // AttachmentButton
                        ButtonAttachment()
                        
                        // Complete Button
                        CompletionButton(g: g, termsAccepted: $termsAccepted, deepWorkdViewModel: deepWorkVieModel, taskDoing: taskDoing)
                        
                        //pause button
                        PauseButton(g: g)
                    }
                    
                }
            }
        }
        .interactiveDismissDisabled(!termsAccepted)
        .prefersHomeIndicatorAutoHidden(true)
        .onReceive(timer){ time in
            if pomodoroTimer > 0 {
                pomodoroTimer -= 1
            }
        }
    }
    
}

struct DeepWorkSheet_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistanceContainer.viewContext
        DeepWorkSheet(taskDoing: nil, vm: DeepWorkViewModel(context: viewContext))
    }
}
