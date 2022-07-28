//
//  MainView.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

struct MainView : View {
    //using as param for vm
    @Environment(\.managedObjectContext) var viewContext
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View{
        TabView{
            FocusTaskPage(vm: FocusTaskViewModel(context: viewContext))
                .tabItem {
                    Label("Focus", systemImage: "target")
                }
            
            HistoryPage().tabItem {
                Label("History", systemImage: "clock.arrow.circlepath")
            }
        }
        .accentColor(Color(UIColor.systemGreen.darker()!))
        .animation(.easeInOut(duration: 2))
//        .transition(.slide)
    }
}
