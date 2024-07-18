//
//  point Manager.swift
//  LunaLog
//
//  Created by Scholar on 7/18/24.
//

import SwiftUI
import Combine

class PointsManager: ObservableObject {
    @Published var points: Int = 0
    @Published var sleepGoalMet: Bool = false
    @Published var waterGoalMet: Bool = false
    
    func addPoints(_ pointsToAdd: Int) {
        points += pointsToAdd
    }
    
    func checkDailyGoals() {
        if sleepGoalMet && waterGoalMet {
            addPoints(50) // Reward points for meeting both goals
        }
    }
}

