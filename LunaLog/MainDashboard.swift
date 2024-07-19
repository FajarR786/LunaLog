//
//  MainDashboard.swift
//  LunaLog
//
//  Created by Fajar Rashid on 7/16/24.
//

import SwiftUI
import Firebase

struct MainDashboard: View {
    @State private var isUserLoggedOut = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Color4")
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 8) {
                    Rectangle()
                        .fill(Color("Color2")) // Replace with your custom color
                        .frame(height: 15) // Adjust the height as needed
                    
                    Spacer()
                    
                    Text("LunaLog")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 0.1)
                    
                    if let user = Auth.auth().currentUser {
                        Text("\(user.email ?? "User")'s stats")
                            .font(.headline)
                            .padding(.top, 5)
                    }
                    
                    // Placeholder for the user's sleep stats chart
                    // Replace this with a dynamic chart when you have the data
                    Image("chart") // Ensure this matches the name of your chart image in Assets
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .padding(.top, 5)
                    
                    Spacer()
                    
                    Image("logo") // Replace with any other images or components you need
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.top, 5)
                    
                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: SleepLog()) {
                            Text("Sleep Log")
                                .font(.headline) // Smaller font size
                                .foregroundColor(.white)
                                .padding(8) // Smaller padding
                                .background(Color("Color2")) // Ensure this matches a color set in Assets
                                .cornerRadius(8)
                        }
                        NavigationLink(destination: WaterLog()) {
                            Text("Water Log")
                                .font(.headline) // Smaller font size
                                .foregroundColor(.white)
                                .padding(8) // Smaller padding
                                .background(Color("Color2")) // Ensure this matches a color set in Assets
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                            .font(.headline) // Smaller font size
                            .foregroundColor(.white)
                            .padding(8) // Smaller padding
                            .background(Color("Color2")) // Ensure this matches a color set in Assets
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    HStack {
                        NavigationLink(destination: Rewards()) {
                            Text("Rewards")
                                .font(.headline) // Smaller font size
                                .foregroundColor(.white)
                                .padding(8) // Smaller padding
                                .background(Color("Color2")) // Ensure this matches a color set in Assets
                                .cornerRadius(8)
                        }
                        NavigationLink(destination: Progress()) {
                            Text("Progress")
                                .font(.headline) // Smaller font size
                                .foregroundColor(.white)
                                .padding(8) // Smaller padding
                                .background(Color("Color2")) // Ensure this matches a color set in Assets
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    
                    Button(action: {
                        do {
                            try Auth.auth().signOut()
                            isUserLoggedOut = true
                        } catch let signOutError as NSError {
                            print("Error signing out: %@", signOutError)
                        }
                    }) {
                        Text("Sign Out")
                            .font(.subheadline) // Smaller font size
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color3"))
                            .padding(8) // Smaller padding
                            .background(Color("Color5"))
                            .cornerRadius(8)
                    }
                    .padding(.bottom, 20)
                }
            }
            .fullScreenCover(isPresented: $isUserLoggedOut) {
                WelcomeScreen()
            }
        }
    }
}
#Preview {
    MainDashboard()
}
