//
//  AttachmentButton.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

struct ButtonAttachment: View {
    var body: some View {
        HStack {
            Button(action:{}) {
                HStack {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Container@*/VStack/*@END_MENU_TOKEN@*/ {
                        Image(systemName: "paperclip")
                            .foregroundColor(.white)
                            .font(.title3)
                            .cornerRadius(10)
                            .padding(2)
                        
                    }
                    .background(Color(UIColor.systemGreen.darker()!))
                    .cornerRadius(10)
                    .padding(.leading,8)
                    .padding(.vertical,8)
                    
                    Text("Attach")
                        .padding([.trailing,.vertical],8)
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                .background(.white)
                .cornerRadius(33)
                .padding(.leading)
            }
            
            Button(action:{}) {
                HStack {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Container@*/VStack/*@END_MENU_TOKEN@*/ {
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                            .font(.title3)
                            .cornerRadius(10)
                            .padding(2)
                        
                    }
                    .background(Color(UIColor.systemGreen.darker()!))
                    .cornerRadius(10)
                    .padding(.leading,8)
                    .padding(.vertical,8)
                    
                    Text("Image")
                        .padding([.trailing,.vertical],8)
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                .background(.white)
                .cornerRadius(33)
                .padding(.leading,8)
            }
        }
    }
}
