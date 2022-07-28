//
//  ListFooter.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

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
