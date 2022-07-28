//
//  CurrentTaskCard.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

struct CurrentTaskHighlight : View{
    let g : GeometryProxy
    @ObservedObject var focusTasksViewModel : FocusTaskViewModel
    let currentTaskDay : String
    let currentTaskHour : String
    
    var body: some View{
        HStack {
            HStack {
                VStack(alignment: .leading, spacing: 4){
                    Text(focusTasksViewModel.tasks.first?.title ?? "No Task Found, Please Create One!").font(.headline)
                    Text("Due Date : \(currentTaskDay), at \(currentTaskHour)")
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.5))
                    }.padding(.horizontal, 32)
                    
            }.frame(width: g.size.width-32, height: 72, alignment: .leading)
                
                .background(.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.green, lineWidth: 1)
            )
        }
        .padding(.horizontal)
    }
}
