//
//  CreateTaskSheetPage.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 26/07/22.
//

import Foundation
import SwiftUI


struct CreateTaskSheetPage : View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var createTaskViewModel : CreateTaskViewModel
    
    @State private var isDatePickerToggled = false
    
    init(vm: CreateTaskViewModel){
        self.createTaskViewModel = vm
    }
    
    // for date picker
    @State private var dueDate = Date()
    
    var body: some View{
        ZStack{
            Color.gray.opacity(0.2)
            
            GeometryReader{
                g in
                VStack(alignment: .leading) {
                    // Navbar Top
                    HStack{
                        Button(action: {
                            print("Hello")
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
                            print("Hello")
                            createTaskViewModel.save()
                            dismiss()
                            
                        }, label: {
                                Text("Add")
                                .foregroundColor(.gray)
                                    
                            })
                            .padding(.trailing)
                        
                           
                        }
                    .frame(width: g.size.width, height: 44, alignment: .leading)
                       
                    
                    Text("Task Title")
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.lightGray))
                        .padding(.leading,32)
                        .padding(.bottom, -4)
                    
                    // task title text field
                    TextField("Task's Title", text: $createTaskViewModel.title)
                        .textFieldStyle(CustomTextFieldStyle())
                        .frame(width: g.size.width - 32, height: 50, alignment: .center)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
//                    DatePicker(selection: $dueDate, in: ...Date(), displayedComponents: .date) {
//                                    Text("Select a date")
//                        }
//
//                    VStack {
//
//                                DatePicker("Enter your birthday", selection: $dueDate)
//
//                                    .frame(maxHeight: 400)
//                            }
                    
                    Text("Due Date")
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.lightGray))
                        .padding(.leading,32)
                        .padding(.bottom, -4)
                    // Date picker
                    HStack {
                        Button(action:{
                            isDatePickerToggled.toggle()
                        }) {
                            HStack{
                                Image(systemName: "calendar")
                                    .foregroundColor(.white)
                                    .padding(.all, 8)
                                    .background(.red)
                                    .cornerRadius(8)
                                    .padding(.leading)
                                
                                VStack{
                                    Text("Date")
                                    Text("Today")
                                        .font(.caption)
                                        .foregroundColor(Color(UIColor.systemGreen.darker()!))
                                }
                            }
                            .frame(width: g.size.width - 32, height: 50, alignment: .leading)
                            .background(.white)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                        
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    if(isDatePickerToggled){
                        VStack {
                            DatePicker("Enter your birthday", selection: $dueDate, in: ...Date())
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .frame(minWidth: 100, idealWidth: 200, maxWidth: g.size.width - 32, minHeight: 200, idealHeight: 200 , maxHeight: g.size.width - 32, alignment: .center
                            )
//                            padding()
                        }
                        
                        .background(.white)
                        .padding()
                    }
                    
                    
                    HStack{
                        Image(systemName: "clock.fill")
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(.blue)
                            .cornerRadius(8)
                            .padding(.leading)
                        
                        VStack{
                            Text("Time")
                            Text("00.00")
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
        }
    }
}


struct CreateTaskSheetPage_Preview : PreviewProvider{
    
    static var previews: some View{
        let viewContext = CoreDataManager.shared.persistanceContainer.viewContext
        CreateTaskSheetPage(vm: CreateTaskViewModel(context: viewContext))
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
