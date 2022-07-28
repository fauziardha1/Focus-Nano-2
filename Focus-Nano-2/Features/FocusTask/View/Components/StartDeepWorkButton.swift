//
//  StartDeepWorkButton.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

struct StartDeepWorkButton: View {
    let g : GeometryProxy
    @Binding var isShowingDeepWorkSheet : Bool
    let currentTask : TaskViewModel?
    var isTasksEmpty : Bool
    
    var body: some View {
        Button(action: {
            if !isTasksEmpty {
                self.isShowingDeepWorkSheet.toggle()
            }
        }) {
            HStack(alignment: .center){
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Container@*/VStack/*@END_MENU_TOKEN@*/ {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 33, height: 33, alignment: .center)
                        .foregroundColor(Color(UIColor.systemGreen.darker(by: 30.0)!))
                        .background(.white)
                        .cornerRadius(17)
                }.padding(.leading, 32)
                
                Text("Start Deep Work")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.horizontal)
            }.frame(width: g.size.width - 32, height: 64, alignment: .leading)
                .background(Color("greenButtonBG"))
                .cornerRadius(10)
            
        }.padding(.horizontal)
            .disabled(isTasksEmpty)
            .sheet(isPresented: $isShowingDeepWorkSheet){
                DeepWorkSheet(taskDoing: currentTask)
            }
            .padding(.top,8)
            .shadow(color: isTasksEmpty ? .clear : .gray, radius: 2, x: 2, y: 3)
        
    }
}
