//
//  Late.swift
//  LunaLog
//
//  Created by Aaliyah Sorto on 7/17/24.
//

import SwiftUI

struct Late: View {
    @State private var time = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Color4") // Replace with your custom background color
                    .opacity(0.6)
                    .edgesIgnoringSafeArea(.all) // Ensure the background color covers the entire screen
                
                VStack {
                    Text("Late Sleeper")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                    Spacer()
                        .frame(height: 20.0)
                    Text("You've identified yourself as a Late Sleeper this means that you're likely an individual who gains minimal sleep time, and you usually end up going to sleep extremely late and tend to wake up late in the day.")
                    Spacer()
                        .frame(height: 20.0)
                    Text("Challenges You Might Have Faced")
                        .fontWeight(.semibold)
                    Text("Late sleepers tend to find it difficult waking up early, usually missing out on morning opportunities, may face life conflicts due to sleeping habits, and may pertain to serious health issues such as poor diet and lack of exercise.")
                    Spacer()
                        .frame(height: 20.0)
                    Text("Possible Solutions")
                        .fontWeight(.semibold)
                    Text("Some things late sleepers can try doing to fix their sleeping problems is to adjust their bedtime gradually, use blackout curtains and white noise, and build a calming bedtime routine.")
                    Spacer()
                        .frame(height: 20.0)
                    Text("Click On A Goal To Receive A Suggestion")
                        .fontWeight(.semibold)
                    Spacer()
                        .frame(height: 15.0)
                    Button("Gradually adjust your sleep times to be earlier") {
                        time = "Suggested Bedtime: 11:30 PM - 12:00 AM" + " Suggested Wake Up: 7:00 AM - 8:00 AM "
                    }
                    .font(.title3)
                    .buttonStyle(.borderedProminent)
                    .tint(Color("Color2"))
                    Button("Extend your sleep duration") {
                        time = "Suggested Bedtime: 10:00 PM - 11:00 PM" + " Suggested Wake Up: 6:00 AM - 7:00 AM "
                    }
                    .font(.title3)
                    .buttonStyle(.borderedProminent)
                    .tint(Color("Color2"))
                    Button("Ensure you have a consistent, uninterrupted sleep schedule") {
                        time = "Suggested Bedtime: 12:00 AM          " + " Suggested Wake Up: 8:00 AM "
                    }
                    .font(.title3)
                    .buttonStyle(.borderedProminent)
                    .tint(Color("Color2"))
                    Spacer()
                        .frame(height: 10.0)
                    Text(time)
                        .font(.headline)
                }
                .padding()
            }
        }
    }
}

#Preview {
    Late()
}
