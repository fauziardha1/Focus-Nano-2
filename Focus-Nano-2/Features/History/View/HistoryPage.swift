//
//  HistoryPage.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 26/07/22.
//

import SwiftUI

struct Taske : Identifiable, Hashable {
    let title : String
    let dueDate : Date
    let id = UUID()
}

struct HistoryPage: View {
    @Environment(\.dismiss) var dismiss
    
    var upComingTask :[Taske] = [
        Taske(
            title: "Create Code Base Nano 2",
            dueDate: Date.now),
        Taske(
            title: "Code UI for main page",
            dueDate: Date.now.addingTimeInterval(86400)),
        Taske(
            title: "Add logic to main page",
            dueDate: Date.now.addingTimeInterval(86400*2)),
    ]
    
    var body: some View {
        ZStack{
            Color(UIColor.secondarySystemBackground)
            
            GeometryReader{
                g in
                VStack(alignment:.leading){
                    // Navbar
                    HStack{
                        Button(action: {
                            dismiss()
                            
                        }, label: {
                                //Text("Back")
                                //.foregroundColor(Color(UIColor.systemGreen.darker(by: 30.0)!))
                                    
                            })
                            .padding(.leading)
                        
                        }
                    .frame(width: g.size.width, height: 44, alignment: .leading)
                    .background(.white)
                    
                    
                    // Page title
                    Text("History")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    List {
                        Section(header:Text("Yesterday Task")) {
                            
                            ForEach(upComingTask, id: \.self){ task in
                                HStack {
                                    let title = task.title
                                    let day = "Today"
                                    let hour = "8 PM"
                                    
                                    Text(title).font(.body)
                                    Spacer()
                                    Text(day+", "+hour)
                                        .font(.subheadline)
                                        .foregroundColor(.black.opacity(0.5))
                                }
                            }
                        }
                        
                        Section(header:Text("Jul 24 Task")) {
                            
                            ForEach(upComingTask, id: \.self){ task in
                                HStack {
                                    let title = task.title
                                    let day = "Today"
                                    let hour = "8 PM"
                                    
                                    Text(title).font(.body)
                                    Spacer()
                                    Text(day+", "+hour)
                                        .font(.subheadline)
                                        .foregroundColor(.black.opacity(0.5))
                                }
                            }
                        }
                        
                        Section(header:Text("Jul 23 Task")) {
                            
                            ForEach(upComingTask, id: \.self){ task in
                                HStack {
                                    let title = task.title
                                    let day = "Today"
                                    let hour = "8 PM"
                                    
                                    Text(title).font(.body)
                                    Spacer()
                                    Text(day+", "+hour)
                                        .font(.subheadline)
                                        .foregroundColor(.black.opacity(0.5))
                                }
                            }
                        }
                           
                    }
                    .padding(.top, -16)
                    
                }
            }
        }
    }
}

struct HistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPage()
            .previewInterfaceOrientation(.portrait)
    }
}
