//
//  ContentView.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 25/07/22.
//

import SwiftUI

struct Task : Identifiable, Hashable {
    let title : String
    let dueDate : Date
    let id = UUID()
}

struct FocusTaskPage: View {
    var upComingTask :[Task] = [
        Task(
            title: "Create Code Base Nano 2",
            dueDate: Date.now),
        Task(
            title: "Code UI for main page",
            dueDate: Date.now.addingTimeInterval(86400)),
        Task(
            title: "Add logic to main page",
            dueDate: Date.now.addingTimeInterval(86400*2)),
    ]
    
    @State private var isShowingCreateTaskpage = false
    @State private var isShowingDeepWorkSheet = false
    @State private var isGoToHistorypage = false
   
    
    var body: some View {
        ZStack {
            grayBackground()
            
            GeometryReader { g in
                VStack(alignment: .leading) {
                    
                    // Navbar Top
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
                            .sheet(isPresented: $isShowingCreateTaskpage){
                                CreateTaskSheetPage()
                            }
                        }
                        .frame(width: g.size.width, height: 44, alignment: .trailing)
                        .background(.white)
                    
                    
                    // Page Title and avatar
                    HStack {
                        Text("Focus Task")
                            .bold()
                            .font(.title)
                        
                        Spacer()
                        
                        Image("avatar")
                            .resizable()
                                .frame(width: 32.0, height: 32.0)
                    }
                    .padding()
                        
                    
                    Group {
                        Text("Current Task".uppercased())
                            .font(.subheadline)
                            .foregroundColor(Color(UIColor.lightGray))
                            .padding(.leading, 43)
                            .padding(.bottom, -4)
                            
                    
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Container@*/VStack/*@END_MENU_TOKEN@*/ {
                        VStack(alignment: .leading, spacing: 4){
                            Text("This is your current task").font(.headline)
                            Text("Due Date : Today, at 6 PM")
                                .font(.subheadline)
                                .foregroundColor(.black.opacity(0.5))
                        }.padding(.horizontal, 32)
                        
                    }.frame(width: g.size.width - 32, height: 72, alignment: .leading)
                        .background(.green.opacity(0.5))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    
                    
                    
                        Button(action: {
                            print("hello")
                            self.isShowingDeepWorkSheet.toggle()
                        }) {
                            HStack(alignment: .center){
                                Image(systemName: "play.circle.fill")
                                    .resizable()
                                    .frame(width: 33, height: 33, alignment: .center)
                                    .foregroundColor(Color(UIColor.systemGreen.darker(by: 30.0)!))
                                    .padding(.leading, 32)
                                
                                Text("Start Deep Work")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                            }.frame(width: g.size.width - 32, height: 64, alignment: .leading)
                                .background(.green.opacity(0.5))
                                .cornerRadius(10)
                            
                            
                        }.padding(.horizontal)
                            .sheet(isPresented: $isShowingDeepWorkSheet){
                                DeepWorkSheet()
                            }
                    }
                    
                    
                    List {
                        Section(header:Text("Upcoming Task"), footer: ListFooter(width: g.size.width, isGoToHistoryPage: $isGoToHistorypage)) {
                            
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
                    
                    

                    Spacer()
                    
                }
                
            }
            
        }
        .navigate(to: HistoryPage(), when: $isGoToHistorypage)
        
    }
        
       
    
    
    
    @ViewBuilder
    func grayBackground() -> some View{
        Color(UIColor.secondarySystemBackground)
    }
}



func helloman()  {
    print("Hello Man")
}

func handleButtonAddTask( @Binding isPageShows : Bool)  {
    isPageShows.toggle()
    print("Jalan oy")
}

struct ListFooter: View {
    let width : Double
    @Binding var isGoToHistoryPage : Bool
    var body: some View {
        HStack {
            Button(action:{
                isGoToHistoryPage.toggle()
            }){
                Text("History")
                    .underline()
                    .font(.footnote)
                    .padding(.horizontal, 32)
                    .foregroundColor(Color(UIColor.systemGreen))
            }
        }.frame(width: width, height: 28, alignment: .trailing)
            .padding(.top, -32)
            
    }
}


struct FocusTaskPage_Previews: PreviewProvider {
    static var previews: some View {
        FocusTaskPage()
            .previewInterfaceOrientation(.portrait)
    }
}
