//
//  LunaLogApp.swift
//  LunaLog
//
//  Created by Fajar Rashid on 7/15/24.
//

import SwiftUI
import FirebaseCore

@main
struct LunaLogApp: App {
    // Register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
