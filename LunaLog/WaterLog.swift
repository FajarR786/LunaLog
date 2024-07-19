//
//  WaterLog.swift
//  LunaLog
//
//  Created by Fajar Rashid on 7/17/24.
//

// Need to change color and background

import SwiftUI
import UserNotifications

struct WaterLog: View {
    @State private var totalWater: Double = 0
    private let dailyGoal: Double = 3000 // Daily goal in ml
    
    var body: some View {
        ZStack {
            Color("Color4")
                .opacity(0.6)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Water Tracker")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                Text("\(Int(totalWater)) ml / \(Int(dailyGoal)) ml")
                    .font(.title)
                    .padding()
                
                ProgressView(value: totalWater, total: dailyGoal)
                    .progressViewStyle(LinearProgressViewStyle())
                    .padding()
                
                Text("Consumed: \(Int(totalWater / dailyGoal * 100))%")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color("Color2"))
                    .padding()
                
                HStack {
                    Button(action: {
                        addWater(amount: 100)
                    }) {
                        Text("Add 100ml")
                            .fontWeight(.semibold)
                            .padding()
                            .background(Color("Color3"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        addWater(amount: 200)
                    }) {
                        Text("Add 200ml")
                            .fontWeight(.semibold)
                            .padding()
                            .background(Color("Color3"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        addWater(amount: 500)
                    }) {
                        Text("Add 500ml")
                            .fontWeight(.semibold)
                            .padding()
                            .background(Color("Color3"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
                
                Button(action: {
                    resetWater()
                }) {
                    Text("Reset")
                        .fontWeight(.semibold)
                        .padding()
                        .background(Color("Color4"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
        }
        .onAppear(perform: setupNotifications)
    }
    
    private func addWater(amount: Double) {
        totalWater += amount
        if totalWater > dailyGoal {
            totalWater = dailyGoal
        }
    }
    
    private func resetWater() {
        totalWater = 0
    }
    
    private func setupNotifications() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                scheduleNotification()
            }
        }
    }
    
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Stay Hydrated!"
        content.body = "Don't forget to drink water today."
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = 10 // Reminder at 10 AM
        dateComponents.minute = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

struct WaterLog_Previews: PreviewProvider {
    static var previews: some View {
        WaterLog()
    }
}


