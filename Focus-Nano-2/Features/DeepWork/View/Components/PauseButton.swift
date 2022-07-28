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
    
    var body: some View {
        Button(action:{}) {
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
    }
}
