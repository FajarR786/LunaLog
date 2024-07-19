//
//  Progress.swift
//  LunaLog
//
//  Created by Fajar Rashid on 7/17/24.
//

import SwiftUI

struct ProgressView: View {
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
            // MARK: Background
            Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                .ignoresSafeArea()
            
            content
        }
    }
    var content: some View {
        ZStack {
            VStack(spacing: 40) {
                // MARK: Title
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                // MARK: Sleeping Plan
                Text(sleepManager.sleepPlan.rawValue)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                
                Spacer()
            }
            .padding()
            
            VStack(spacing: 40) {
                // MARK: Progress Ring
                ProgressRing()
                    .environmentObject(sleepManager)
                
                HStack(spacing: 60) {
                    // MARK: Start Time
                    VStack(spacing: 5) {
                        Text(sleepManager.sleepState == .notStarted ? "Start" : "Started")
                            .opacity(0.7)
                        Text(sleepManager.startTime, format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                    // MARK: End Time
                    VStack(spacing: 5) {
                        Text(sleepManager.sleepState == .notStarted ? "End" : "Ends")
                            .opacity(0.7)
                        Text(sleepManager.endTime, format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                }
                // MARK: Button
                Button {
                    sleepManager.toggleSleepState()
                } label: {
                    Text(sleepManager.sleepState == .sleeping ? "End sleep" : "Start sleep")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

#Preview {
    ProgressView()
}
