//
//  FocusTaskNavbar.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

struct FocusTaskNavBar: View {
    let g : GeometryProxy
    @Binding var isShowingCreateTaskpage : Bool
    //using as param for vm
    @Environment(\.managedObjectContext) var viewContext
    let sortingTask : ()->Void
    
    var body: some View {
        HStack{
            Button(action: {
                isShowingCreateTaskpage.toggle()
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
                    .foregroundColor(.green)
                
            })
            .padding(.trailing)
            .sheet(isPresented: $isShowingCreateTaskpage, onDismiss: {
                sortingTask()
            }){
                CreateTaskSheetPage(vm: CreateTaskViewModel(context: viewContext))
            }
            
        }
        .frame(width: g.size.width, height: 44, alignment: .trailing)
        .background(.white)
    }
}
