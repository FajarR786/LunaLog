//
//  OnboardingFlow.swift
//  LunaLog
//
//  Created by Fajar Rashid on 7/16/24.
//

import SwiftUI

struct OnboardingFlow: View {
    @State private var sleepGoal = ""
    @State private var navigateToMainDashboard = false
    
    var body: some View {
        ZStack {
            Color("Color4") // Replace with your custom background color
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Set Your Sleep Goal")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Color1"))
                    .padding()
                
                TextField("Enter your sleep goal (e.g., 8 hours)", text: $sleepGoal)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.horizontal, 20)
                
                Button(action: {
                    saveSleepGoal()
                    navigateToMainDashboard = true
                }) {
                    Text("Save")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("Color2"))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
            }
            .padding()
            .fullScreenCover(isPresented: $navigateToMainDashboard) {
                MainDashboard() // Placeholder for MainDashboard
            }
        }
    }
    
    private func saveSleepGoal() {
        // Save the sleep goal to a database or local storage as needed
        print("Sleep goal saved: \(sleepGoal)")
    }
}

struct OnboardingFlow_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFlow()
    }
}
