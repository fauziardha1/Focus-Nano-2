//
//  CompleteButton.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI
import CoreData

struct CompletionButton: View {
    let g : GeometryProxy
    @Binding var termsAccepted : Bool
    @Environment(\.dismiss) var dismiss
    @ObservedObject var deepWorkdViewModel : DeepWorkViewModel
    let taskDoing : TaskViewModel?
    
    var body: some View {
        Button(action:{
            
            termsAccepted.toggle()
            if taskDoing != nil {
                deepWorkdViewModel.updateTask(task: taskDoing!, status: true)
            }
            
        }) {
            HStack{
                Text("I have complete this task")
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(width: g.size.width-32, height: 44, alignment: .center)
            .background(Color(UIColor.systemGreen.darker()!))
            .cornerRadius(22)
            .padding(.horizontal)
            .padding(.top,24)
        }
        .alert(isPresented: $termsAccepted ) {
                    Alert(
                        title: Text("You dit it!"),
                        message: Text("Great Job"),
                        dismissButton: .default(
                            Text("Got it!"),
                            action: {dismiss()}
                        )
                    )
        }
    }
}
