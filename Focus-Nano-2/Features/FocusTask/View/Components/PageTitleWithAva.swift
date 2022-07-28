//
//  PageTitleWithAva.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

struct PageTitleWithAva: View {
    var body: some View {
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
    }
}
