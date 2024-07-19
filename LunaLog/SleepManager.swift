//
//  SleepManager.swift
//  LunaLog
//
//  Created by Aaliyah Sorto on 7/18/24.
//

import Foundation
import Combine

enum SleepState {
    case notStarted
    case sleeping
    case awake
}

enum SleepPlan: String {
    case early = "Early"
    case decent = "Decent"
    case late = "Late"

    var sleepPeriod: Double {
        switch self {
        case .early:
            return 7
        case .decent:
            return 8
        case .late:
            return 9
        }
    }
}

class SleepManager: ObservableObject {
    @Published private(set) var sleepState: SleepState = .notStarted
    @Published private(set) var sleepPlan: SleepPlan {
        didSet {
            updateEndTime()
        }
    }
    @Published private(set) var startTime: Date
    @Published private(set) var endTime: Date
    @Published private(set) var elapsed: Bool = false
    @Published private(set) var elapsedTime: Double = 0.0
    @Published private(set) var progress: Double = 0.0

    var sleepTime: Double {
        return sleepPlan.sleepPeriod * 60 * 60
    }

    var awakeTime: Double {
        return (24 - sleepPlan.sleepPeriod) * 60 * 60
    }

    init(sleepPlan: SleepPlan = .decent) {
        self.sleepPlan = sleepPlan

        let calendar = Calendar.current
        let components = DateComponents(hour: 20)
        let scheduledTime = calendar.nextDate(after: Date(), matching: components, matchingPolicy: .nextTime) ?? Date()
        startTime = scheduledTime

        endTime = scheduledTime.addingTimeInterval(sleepPlan.sleepPeriod * 60 * 60)
    }

    func updateEndTime() {
        self.endTime = self.startTime.addingTimeInterval(sleepPlan.sleepPeriod * 60 * 60)
    }

    func toggleSleepState() {
        switch sleepState {
        case .notStarted:
            sleepState = .sleeping
            startTime = Date()
            endTime = startTime.addingTimeInterval(sleepTime)
        case .sleeping:
            sleepState = .awake
            endTime = Date()
        case .awake:
            sleepState = .notStarted
            startTime = Date()
            updateEndTime()
        }
        elapsedTime = 0.0
    }

    func track() {
        guard sleepState != .notStarted else { return }
        let now = Date()
        if endTime >= now {
            elapsed = false
        } else {
            elapsed = true
        }
        elapsedTime = now.timeIntervalSince(startTime)
        let totalTime = sleepState == .sleeping ? sleepTime : awakeTime
        progress = (elapsedTime / totalTime).rounded()
    }
}
