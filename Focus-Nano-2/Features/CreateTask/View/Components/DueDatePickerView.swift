//
//  DueDatePickerView.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import SwiftUI

struct DueDatePicker: View {
    let g : GeometryProxy
    @Binding var isTimePickerToggled : Bool
    @Binding var isDatePickerToggled : Bool
    @ObservedObject var datePickerModel : DueDatePikerModel
    @ObservedObject var createTaskViewModel : CreateTaskViewModel
    
    
    
    var body: some View {
        HStack {
            VStack {
                Button(action:{
                    isDatePickerToggled.toggle()
                    isTimePickerToggled = false
                }) {
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(.red)
                            .cornerRadius(8)
                            .padding(.leading)
                        
                        VStack(alignment:.leading){
                            Text("Date")
                            
                            Text((createTaskViewModel.dueDate ?? Date.now).getDayStr())
                                .font(.caption)
                                .foregroundColor(Color(UIColor.systemGreen.darker()!))
                        }
                    }
                    .frame(width: g.size.width - 32, height: 50, alignment: .leading)
                    .background(.white)
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    
                }
                
                // date picker
                if(isDatePickerToggled){
                    VStack {
                        DatePicker(
                            "",
                            selection: $datePickerModel.dueDate,
                            in: Date()...Date().addingTimeInterval(60*60*24*365),
                            displayedComponents: [.date]
                        ).onChange(of: datePickerModel.dueDate, perform: {(date) in
                            createTaskViewModel.dueDate = date
                            debugPrint("Choosen Date \(createTaskViewModel.dueDate ?? Date.now)")
                        })
                        .datePickerStyle(.graphical)
                        .accentColor(.green)
                        .background(.white, in: RoundedRectangle(cornerRadius: 10))
                        .cornerRadius(10)
                        .frame(
                            maxWidth: g.size.width - 32,
                            maxHeight: g.size.width - 32,
                            alignment: .center)
                        
                        
                    }
                    .padding(.top, -10)
                }
            }
            
        }
        .padding(.horizontal)
    }
}
