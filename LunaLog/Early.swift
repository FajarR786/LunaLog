//
//  Early.swift
//  LunaLog
//
//  Created by Aaliyah Sorto on 7/17/24.
//

import SwiftUI

struct Early: View {
    @State private var time = ""
    var body: some View {
        ZStack {
            Color("Color4")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Early Sleeper")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 20.0)
                Text("You've identified yourself as an Early Sleeper this means that you usually sleep and wake up early, which may cause you to have lots of free time during the day.")
                    .foregroundColor(.white)
                Spacer()
                    .frame(height: 20.0)
                Text("Challenges You Might Have Faced")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text("Early risers might find themselves unproductive in the evenings, might be too tired to enjoy evening activities, if there are schedule changes,and may have trouble adapting.")
                    .foregroundColor(.white)
                Spacer()
                    .frame(height: 20.0)
                Text("Possible Solutions")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text("Maintain a consistent sleep schedule, create a relaxing evening routine where you can perform calming activities until it's time to sleep, and use light exposure to maintain a nature waking up and sleeping cycle")
                    .foregroundColor(.white)
                Spacer()
                    .frame(height: 20.0)
                Text("Click on a Goal to receive a Suggestion")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 15.0)
                Button("Maintain early bedtimes but ensure you are getting enough sleep") {
                    time = "Suggested Bedtime: 9:30 PM - 10:00 PM" + " Suggested Wake Up: 5:30 AM - 6:00 AM "
                }
                .font(.title3)
                .buttonStyle(.borderedProminent)
                .tint(Color("Color2"))
                Button("Improve sleep quality by ensuring you are getting enough sleep and reducing pre-bedtime stress") {
                    time = "Suggested Bedtime: 8:30 PM - 9:00 PM" + " Suggested Wake Up: 4:30 AM - 5:00 AM "
    
                }
                .font(.title3)
                .buttonStyle(.borderedProminent)
                .tint(Color("Color2"))
                Button("Extend sleep duration") {
                    time = "Suggested Bedtime: 8:00 PM - 8:30 PM" + " Suggested Wake Up: 4:00 AM - 4:30 AM "
                }
                .font(.title3)
                .buttonStyle(.borderedProminent)
                .tint(Color("Color2"))
                Spacer()
                    .frame(height: 10.0)
                Text(time) .font(.headline)
                Spacer()
                    .frame(height: 40.0)
        }
        }
        .padding()
        .cornerRadius(75)
    }
}
#Preview {
    Early()
}
