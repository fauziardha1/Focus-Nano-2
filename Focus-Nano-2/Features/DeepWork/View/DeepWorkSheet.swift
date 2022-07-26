//
//  DeepWorkSheet.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 26/07/22.
//

import SwiftUI

struct DeepWorkSheet: View {
    @Environment(\.dismiss) var dismiss
    @State private var taskNotes : String = "  Notes"

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
                                Text("Close")
                                .foregroundColor(Color(UIColor.systemGreen.darker(by: 30.0)!))
                                    
                            })
                            .padding(.leading)
                        
                        // header
                        Text("Deep Work")
                            .font(.headline)
                            .padding(.leading, (g.size.width-188)/2)
                        
                        
                        
                           
                        }
                    .frame(width: g.size.width, height: 44, alignment: .leading)
                    
                    
                    HStack {
                        Text("Pomodoro Time")
                            .padding()
                        Spacer()
                        Text("24:59")
                            .padding()
                    }
                    .padding(.top)
                       
                    
                    
                    // task title
                    Text("Task Title")
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.lightGray))
                        .padding(.leading,32)
                        .padding(.bottom, -4)
                    
                    Text("Task's Title")
                        .frame(width: g.size.width - 48, height: 50, alignment: .leading)
                        .padding(.leading)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 32)
                        
                    
                    
                    // Due Date Section
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
                    
                    
                    // Notes Section
                    // task title
                    Text("Notes")
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.lightGray))
                        .padding(.leading,32)
                        .padding(.bottom, -4)
                        .padding(.top)
                    
                    TextEditor( text: $taskNotes)
                        .lineLimit(5)
                        .textFieldStyle(CustomTextFieldStyle())
                        .frame(width: g.size.width - 32, height: 150, alignment: .center)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .foregroundColor(taskNotes == "  Notes" ? .gray : .black)
                    
                   
                  
                    VStack {
                        // Complete Button
                        Button(action:{}) {
                            HStack{
                                Text("I have complete this task")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            .frame(width: g.size.width-32, height: 44, alignment: .center)
                            .background(Color(UIColor.systemGreen.darker()!))
                            .cornerRadius(22)
                            .padding(.horizontal)
                            .padding(.top,24)
                        }
                        
                        //pause button
                        Button(action:{}) {
                            HStack{
                                Text("Pause")
                                    .foregroundColor(.white)
                            }
                            .frame(width: g.size.width-32, height: 44, alignment: .center)
                            .background(.gray)
                            .cornerRadius(22)
                            .padding(.horizontal)
                        }
                        
                    }
                    
                   
                
                    
                }
            }
        }
    }
}

struct DeepWorkSheet_Previews: PreviewProvider {
    static var previews: some View {
        DeepWorkSheet()
    }
}
