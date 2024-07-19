//
//  Progress.swift
//  LunaLog
//
//  Created by Fajar Rashid on 7/17/24.
//

import SwiftUI

struct CustomProgressView: View {
    @StateObject var sleepManager = SleepManager()

    var title: String {
        switch sleepManager.sleepState {
        case .notStarted:
            return "Let's begin!"
        case .sleeping:
            return "You are now sleeping"
        case .awake:
            return "You are now awake"
        }
    }

    var body: some View {
        ZStack {
            Color("Color4")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(sleepManager.sleepPlan.rawValue)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(Color("Color1"))
                    .cornerRadius(20)
                
                Spacer()
                
                ProgressRing()
                    .environmentObject(sleepManager)
                
                HStack(spacing: 60) {
                    VStack(spacing: 5) {
                        Text(sleepManager.sleepState == .notStarted ? "Start" : "Started")
                            .opacity(0.7)
                        Text(sleepManager.startTime, format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                    VStack(spacing: 5) {
                        Text(sleepManager.sleepState == .notStarted ? "End" : "Ends")
                            .opacity(0.7)
                        Text(sleepManager.endTime, format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                }
                
                Button {
                    sleepManager.toggleSleepState()
                } label: {
                    Text(sleepManager.sleepState == .sleeping ? "End sleep" : "Start sleep")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(Color("Color2"))
                        .cornerRadius(20)
                }
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView()
    }
}
