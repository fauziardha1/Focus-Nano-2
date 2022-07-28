//
//  NavbarView.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import SwiftUI

struct CraeateTaskSheetNavbarTop: View {
    let g : GeometryProxy
    @ObservedObject var createTaskViewModel : CreateTaskViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack{
            Button(action: {
                dismiss()
                
            }, label: {
                Text("Cancel")
                    .foregroundColor(Color(UIColor.systemGreen.darker(by: 30.0)!))
                
            })
            .padding(.leading)
            
            Spacer()
            
            // header
            Text("New Task")
                .font(.headline)
            
            Spacer()
            
            Button(action: {
                
                if !createTaskViewModel.title.isEmpty && createTaskViewModel.dueDate != nil {
                    createTaskViewModel.save()
                    dismiss()
                }
                
            }, label: {
                Text("Add")
                    .foregroundColor(
                        !createTaskViewModel.title.isEmpty && createTaskViewModel.dueDate != nil
                        ? Color(UIColor.systemGreen.darker(by: 30.0)!)
                        : .gray
                    )
                
            })
            .disabled(createTaskViewModel.title.isEmpty || createTaskViewModel.dueDate == nil)
            .padding(.trailing)
            
            
        }
        .frame(width: g.size.width, height: 44, alignment: .leading)
    }
}
