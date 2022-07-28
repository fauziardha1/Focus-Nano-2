//
//  CompleteButton.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

struct CompletionButton: View {
    let g : GeometryProxy
    @Binding var termsAccepted : Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action:{
            termsAccepted.toggle()
            dismiss()
        }) {
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
    }
}
