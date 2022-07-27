//
//  ContentView.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 25/07/22.
//

import SwiftUI

struct Taske : Identifiable, Hashable {
    let title : String
    let dueDate : Date
    let id = UUID()
}

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

struct FocusTaskPage: View {
    @State private var isShowingCreateTaskpage = false
    @State private var isShowingDeepWorkSheet = false
    @State private var isGoToHistorypage = false
    
    //using as param for vm
    @Environment(\.managedObjectContext) var viewContext
    
    // initiate vm
    @ObservedObject var focusTasksViewModel : FocusTaskViewModel
    
    init(vm: FocusTaskViewModel){
        self.focusTasksViewModel = vm
    }
    
    private func deleteTask(at offsets : IndexSet){
        offsets.forEach{
            index in
            let task = focusTasksViewModel.tasks[index]
            focusTasksViewModel.deleteTask(taskID: task.id)
        }
    }
    
    var body: some View {
        ZStack {
            grayBackground()
            
            GeometryReader { g in
                VStack(alignment: .leading) {
                    
                    // Navbar Top
                    HStack{
                        Button(action: {
                            isShowingCreateTaskpage.toggle()
                           
                            print("Hello")
                            
                        }, label: {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 24, height: 24, alignment: .center)
                                    .foregroundColor(.green)
                                    
                            })
                            .padding(.trailing)
                            .sheet(isPresented: $isShowingCreateTaskpage){
                                CreateTaskSheetPage(vm: CreateTaskViewModel(context: viewContext))
                            }
                        }
                        .frame(width: g.size.width, height: 44, alignment: .trailing)
                        .background(.white)
                    
                    
//                    List(focusTasksViewModel.tasks){
//                        task in
//                        Text(task.title)
//                    }
                    
                    
                    
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
                            HStack {
                                    
                                    VStack(alignment: .leading, spacing: 4){
                                        Text(focusTasksViewModel.tasks.first?.title ?? "No Task Found, Please Create One!").font(.headline)
                                        Text("Due Date : Today, at 6 PM")
                                            .font(.subheadline)
                                            .foregroundColor(.black.opacity(0.5))
                                        }.padding(.horizontal, 32)
                                    
                            }.frame(width: g.size.width-32, height: 72, alignment: .leading)
                                
                                .background(.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.green, lineWidth: 1)
                            )
                        }
                        .padding(.horizontal)
                            
                        
                        
                    
                    
                    
                    
                        Button(action: {
                            print("hello")
                            self.isShowingDeepWorkSheet.toggle()
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
                                .background(.green.opacity(0.3))
                                .cornerRadius(10)
                            
                        }.padding(.horizontal)
                            .sheet(isPresented: $isShowingDeepWorkSheet){
                                DeepWorkSheet(title: focusTasksViewModel.tasks.first?.title ?? "Unknown Data")
                        }
                            .padding(.top,8)
                            .shadow(color: .gray, radius: 3, x: 2, y: 5)
                    }
                    
                    
                    List {
                        Section(header:Text("Upcoming Task"), footer: ListFooter(width: g.size.width, isGoToHistoryPage: $isGoToHistorypage)) {
                            
                            ForEach(focusTasksViewModel.tasks){ task in
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
                            }.onDelete(perform: deleteTask)
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
            .ignoresSafeArea()
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
        let viewContext = CoreDataManager.shared.persistanceContainer.viewContext
        FocusTaskPage(vm: FocusTaskViewModel(context: viewContext))
            .previewInterfaceOrientation(.portrait)
    }
}
