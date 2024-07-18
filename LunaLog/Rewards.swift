//
//  Rewards.swift
//  LunaLog
//
//  Created by Fajar Rashid on 7/17/24.
//

import SwiftUI

struct Rewards: View {
    @State private var points: Int = 0
    @State private var sleepGoalMet: Bool = false
    
    var body: some View {
        ZStack {
            Color("Color3")
                .edgesIgnoringSafeArea(.all) // Ensure the background color fills the entire screen

            VStack {
                VStack {
                    Text("Rewards Page")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding()
                        .foregroundColor(Color("Color5")) // Ensure the text color is white

                    Text("Points: \(points)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                        .foregroundColor(Color("Color4"))

                    if points >= 50 {
                        Text("Congratulations! You earned a reward!")
                            .font(.title)
                            .foregroundColor(.green)
                            .padding()
                    }

                    // Simulate adding points for meeting goals
                    Button(action: {
                        if sleepGoalMet {
                            points += 50 // Reward points for meeting the sleep goal
                        } else {
                            points += 10 // Add points for demonstration
                        }
                    }) {
                        Text("Add Points")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color5"))
                            .padding()
                            .background(Color("Color1"))
                            .cornerRadius(8)
                    }
                    .padding()

                    // Toggle sleep goal met for demonstration
                    Toggle("Sleep Goal Met", isOn: $sleepGoalMet)
                        .padding()
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color("Color1").opacity(0.5)) // Background color for the square box
                .cornerRadius(10)
                .padding()
                
                Spacer()
            }
        }
    }
}

struct Rewards_Previews: PreviewProvider {
    static var previews: some View {
        Rewards()
    }
}




