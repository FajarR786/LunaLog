//
//  AppDelegate.swift
//  LunaLog
//
//  Created by Fajar Rashid on 7/16/24.
//

import UIKit
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

