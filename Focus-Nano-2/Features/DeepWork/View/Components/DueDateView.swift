//
//  DueDateView.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

struct DueDateView: View {
    let g : GeometryProxy
    let taskDoing : TaskViewModel?
    
    var body: some View {
        HStack{
            Image(systemName: "calendar")
                .foregroundColor(.white)
                .padding(.all, 8)
                .background(.red)
                .cornerRadius(8)
                .padding(.leading)
            
            VStack(alignment:.leading){
                Text("Date")
                Text(taskDoing?.dueDate.getDayStr() ?? "No Date Found")
                    .font(.caption)
                    .foregroundColor(Color(UIColor.systemGreen.darker()!))
            }
        }
        .frame(width: g.size.width - 32, height: 50, alignment: .leading)
        .background(.white)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
