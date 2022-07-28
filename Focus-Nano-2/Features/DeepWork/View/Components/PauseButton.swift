//
//  PauseButton.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

struct PauseButton: View {
    let g : GeometryProxy
    @Environment(\.dismiss) var dismiss
    @State var isPauseAlertShows = false
    
    var body: some View {
        Button(action:{
            isPauseAlertShows.toggle()
        }) {
            HStack{
                Text("Pause")
                    .foregroundColor(.white)
                    .bold()
            }
            .frame(width: g.size.width-32, height: 44, alignment: .center)
            .background(.gray)
            .cornerRadius(22)
            .padding(.horizontal)
            
        }
        .alert(isPresented: $isPauseAlertShows ) {
                    Alert(
                        title: Text("OH NO!"),
                        message: Text("Are you sure to pause this session?"),
                        primaryButton:  .default(
                            Text("No, back to session")
                                .foregroundColor(Color(UIColor.green.darker()!))
                        ),
                        secondaryButton: .destructive(
                            Text("Yes, Pause"),
                            action: {dismiss()}
                        )
                        
                        
                    )
        }
    }
}
