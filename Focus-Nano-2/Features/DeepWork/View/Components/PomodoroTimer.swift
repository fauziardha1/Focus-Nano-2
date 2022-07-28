//
//  PomodoroTimer.swift
//  Focus-Nano-2
//
//  Created by FauziArda on 28/07/22.
//

import Foundation
import SwiftUI

struct PomodoroTimer: View {
    @Binding  var currentTime : Int
    
    var body: some View {
        HStack {
            Text("Pomodoro Time")
                .bold()
                .padding()
            Spacer()
            Text(currentTime.secondsToMinuteAndSecond()).bold()
                .padding()
        }
        .padding(.top)
    }
}
