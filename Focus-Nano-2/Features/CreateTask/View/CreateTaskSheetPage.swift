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
    @State private var taskTitle : String = ""

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
//                            dismiss()
                            
                        }, label: {
                                Text("Add")
                                .foregroundColor(.gray)
                                    
                            })
                            .padding(.trailing)
                        
                           
                        }
                    .frame(width: g.size.width, height: 44, alignment: .leading)
                       
                    
                    // task title text field
                    TextField("Task's Title", text: $taskTitle)
                        .textFieldStyle(CustomTextFieldStyle())
                        .frame(width: g.size.width - 32, height: 50, alignment: .center)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.vertical, 32)
                        
                    
                    
                    Text("Due Date")
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.lightGray))
                        .padding(.leading,32)
                        .padding(.bottom, -4)
                    // Date picker
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
                    .padding(.horizontal)
                    
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
        CreateTaskSheetPage()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
