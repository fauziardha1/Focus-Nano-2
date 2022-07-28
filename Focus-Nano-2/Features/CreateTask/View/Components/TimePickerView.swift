//
//  TimePickerView.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import SwiftUI

struct TimePicker: View {
    let g : GeometryProxy
    @Binding var isTimePickerToggled : Bool
    @Binding var isDatePickerToggled : Bool
    @ObservedObject var datePickerModel : DueDatePikerModel
    @ObservedObject var createTaskViewModel : CreateTaskViewModel
    
    
    var body: some View {
        HStack {
            VStack {
                Button(action:{
                    isTimePickerToggled.toggle()
                    isDatePickerToggled = false
                }) {
                    HStack{
                        Image(systemName: "clock.fill")
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(.blue)
                            .cornerRadius(8)
                            .padding(.leading)
                        
                        VStack(alignment:.leading){
                            Text("Time")
                            Text(createTaskViewModel.dueDate?.getTimeStr() ?? "00:00")
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
                if(isTimePickerToggled){
                    VStack {
                        DatePicker("",
                                   selection: $datePickerModel.dueDate,
                                   displayedComponents: [.hourAndMinute]
                        ).onChange(of: datePickerModel.dueDate, perform: {(date) in
                           
                            createTaskViewModel.dueDate = date
                            debugPrint("Choosen Time \(createTaskViewModel.dueDate ?? Date.now)")
                            
                        })
                        .datePickerStyle(.wheel)
                        .accentColor(.green)
                        .background(.white, in: RoundedRectangle(cornerRadius: 10))
                        .cornerRadius(10)
                        .frame(minWidth: 100, idealWidth: 200, maxWidth: g.size.width - 32, minHeight: 200, idealHeight: 200 , maxHeight: g.size.width - 32, alignment: .center)
                        
                        .padding(.top, -66)
                    }
                    .padding(.top, -10)
                }
            }
            
        }
        .padding(.horizontal)
    }
}
