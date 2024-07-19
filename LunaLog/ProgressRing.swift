//
//  ProgressRing.swift
//  LunaLog
//
//  Created by Aaliyah Sorto on 7/18/24.
//

import SwiftUI

struct ProgressRing: View {
    @EnvironmentObject var sleepManager: SleepManager

    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.blue)
                .opacity(0.7)

            Circle()
                .trim(from: 0.0, to: min(sleepManager.progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color.blue, Color.purple, Color.cyan]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1.0), value: sleepManager.progress)

            VStack(spacing: 30) {
                if sleepManager.sleepState == .notStarted {
                    VStack(spacing: 5) {
                        Text("Upcoming Sleep")
                            .opacity(0.7)

                        Text("\(sleepManager.sleepPlan.sleepPeriod, specifier: "%.0f") Hours")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                } else {
                    VStack(spacing: 5) {
                        Text("Elapsed Time (\(sleepManager.progress * 100, specifier: "%.0f")%)")
                            .opacity(0.7)

                        Text(sleepManager.startTime, style: .timer)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .padding(.top)

                    VStack(spacing: 5) {
                        if !sleepManager.elapsed {
                            Text("Remaining Time (\((1 - sleepManager.progress) * 100, specifier: "%.0f")%)")
                                .opacity(0.7)
                        } else {
                            Text("Extra Time")
                                .opacity(0.7)
                        }
                        Text(sleepManager.endTime, style: .timer)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .frame(width: 250, height: 250)
        .padding()
        .onReceive(timer) { _ in
            sleepManager.track()
        }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
            .environmentObject(SleepManager())
    }
}
