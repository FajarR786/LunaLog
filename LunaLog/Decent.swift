//
//  Decent.swift
//  LunaLog
//
//  Created by Aaliyah Sorto on 7/17/24.
//

import SwiftUI

struct Decent: View {
    @State private var time = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Color4")// Replace with your custom background color
                    .opacity(0.7)
                    .edgesIgnoringSafeArea(.all) // Ensure the background color covers the entire screen
                
                VStack {
                    Text("Decent Sleeper")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                    Spacer()
                        .frame(height: 20.0)
                    Text("You've identified yourself as an Decent Sleeper this means that you usually have a consistent wake up schedule, usually gain lots of sleep, and have a decent sleep routine.")
                    Spacer()
                        .frame(height: 20.0)
                    Text("Challenges You Might Have Faced")
                        .fontWeight(.semibold)
                    Text("Decent sleepers may struggle to find a good balance between sleeping and responsibility, may find it difficult to sleep due to occasional sleep disruptions, insomnia, or restless nights.")
                    Spacer()
                        .frame(height: 20.0)
                    Text("Possible Solutions")
                        .fontWeight(.semibold)
                    Text("Some things decent sleepers should try is developing a good sleeping hygiene, try managing stress through meditation or journaling, and even doing a workout before bedtime.")
                    Spacer()
                        .frame(height: 20.0)
                    Text("Click on a Goal to receive a Suggestion")
                        .fontWeight(.semibold)
                    Spacer()
                        .frame(height: 15.0)
                    Button("Maintain a regular schedule with sufficient sleep") {
                        time = "Suggested Bedtime: 10:30 PM - 11:00 PM" + " Suggested Wake Up: 6:30 AM - 7:00 AM "
                    }
                    .font(.title3)
                    .buttonStyle(.borderedProminent)
                    .tint(Color("Color2"))
                    Button("Extend sleep duration") {
                        time = "Suggested Bedtime: 9:30 PM - 10:00 PM" + " Suggested Wake Up: 5:30 AM - 6:00 AM "
                    }
                    .font(.title3)
                    .buttonStyle(.borderedProminent)
                    .tint(Color("Color2"))
                    Button("Adjust bedtime for better sleep onset") {
                        time = "Suggested Bedtime: 11:30 PM - 12:00 AM" + " Suggested Wake Up: 7:30 AM - 8:00 AM "
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
    Decent()
}
