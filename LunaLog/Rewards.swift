//
//  Rewards.swift
//  LunaLog
//
//  Created by Fajar Rashid on 7/17/24.
//
import SwiftUI

struct Rewards: View {
    @EnvironmentObject var pointsManager: PointsManager // Access the shared PointsManager

    var body: some View {
        VStack {
            Text("Rewards Page")
                .font(.largeTitle)
                .padding()
            
            Text("Points: \(pointsManager.points)")
                .font(.title)
                .padding()
                .foregroundColor(.white)

            if pointsManager.points >= 50 {
                Text("Congratulations! You earned a reward!")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
            }
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct Rewards_Previews: PreviewProvider {
    static var previews: some View {
        Rewards().environmentObject(PointsManager()) // Provide PointsManager
    }
}



