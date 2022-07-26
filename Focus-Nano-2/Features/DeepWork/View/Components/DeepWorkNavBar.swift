//
//  DeepWorkNavBar.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

struct DeepWorkNavBar: View {
    let g : GeometryProxy
    @Binding var termsAccepted : Bool
    @Environment(\.dismiss) var dismiss
    @State var  isWarningAlertShows : Bool = false
    
    var body: some View {
        HStack{
            Button(action: {
                termsAccepted ? dismiss() : debugPrint("Not Accepted to close")
                isWarningAlertShows.toggle()
                
            }, label: {
                Text("Close")
                    .foregroundColor(termsAccepted
                                     ? Color(UIColor.systemGreen.darker(by: 30.0)!)
                                     : .gray
                    )
                
            })
            .disabled(termsAccepted)
            .padding(.leading)
            .alert(isPresented: $isWarningAlertShows ) {
                        Alert(
                            title: Text("OH NO!"),
                            message: Text("Your deep work session still running. Please Go On"),
                            dismissButton: .default(
                                Text("Continue Deep Work")
                            )
                        )
            }
            
            // header
            Text("Deep Work")
                .font(.headline)
                .padding(.leading, (g.size.width-188)/2)
            
            
            
            
        }
        .frame(width: g.size.width, height: 44, alignment: .leading)
    }
}
