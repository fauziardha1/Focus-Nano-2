//
//  DueTimeView.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

struct DueTimeView: View {
    let g : GeometryProxy
    let taskDoing : TaskViewModel?
    
    var body: some View {
        HStack{
            Image(systemName: "clock.fill")
                .foregroundColor(.white)
                .padding(.all, 8)
                .background(.blue)
                .cornerRadius(8)
                .padding(.leading)
            
            VStack(alignment:.leading){
                Text("Time")
                Text(taskDoing?.dueDate.getTimeStr() ?? "No Time Found")
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
