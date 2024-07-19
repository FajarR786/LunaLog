//
//  Settings.swift
//  LunaLog
//
//  Created by Fajar Rashid on 7/17/24.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    let authManager = AuthenticationManager.shared
    @State private var showLogoutAlert = false
    @State private var showDeleteAccountAlert = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Color3").opacity(0.2), Color("Color1")]), startPoint: .top, endPoint: .bottom)
                .opacity(0.7)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                Button(action: {
                    self.showLogoutAlert = true
                }) {
                    Text("Logout")
                        .foregroundColor(.red)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding()
                .alert(isPresented: $showLogoutAlert) {
                    Alert(title: Text("Logout"), message: Text("Are you sure you want to logout?"), primaryButton: .default(Text("Logout"), action: {
                        // Perform logout action
                        authManager.logout { result in
                            switch result {
                            case .success:
                                print("Logged out successfully")
                            case .failure(let error):
                                print("Error logging out: \(error.localizedDescription)")
                            }
                        }
                    }), secondaryButton: .cancel())
                }
                
                Button(action: {
                    self.showDeleteAccountAlert = true
                }) {
                    Text("Delete Account")
                        .foregroundColor(.red)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding()
                .alert(isPresented: $showDeleteAccountAlert) {
                    Alert(title: Text("Delete Account"), message: Text("Are you sure you want to delete your account? This action cannot be undone."), primaryButton: .destructive(Text("Delete"), action: {
                        // Perform delete account action
                        authManager.deleteAccount { result in
                            switch result {
                            case .success:
                                print("Account deleted successfully")
                                // Optionally handle navigation or show another alert
                            case .failure(let error):
                                print("Error deleting account: \(error.localizedDescription)")
                            }
                        }
                    }), secondaryButton: .cancel())
                }
                
                Spacer()
                
                Image("logo") // Replace with the name of your logo image in Assets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200) // Increased size
                    .padding(.bottom, 20) // Moved up
                
                // Decorative lines or shapes
                HStack {
                    Circle()
                        .fill(Color("Color2"))
                        .frame(width: 50, height: 50)
                    Spacer()
                    Circle()
                        .fill(Color("Color2"))
                        .frame(width: 50, height: 50)
                }
                .padding(.horizontal, 40)
                
                HStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("Color3"))
                        .frame(width: 100, height: 10)
                    Spacer()
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("Color3"))
                        .frame(width: 100, height: 10)
                }
                .padding(.horizontal, 40)
                .padding(.top, 10)
            }
            .padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

class AuthenticationManager {
    static let shared = AuthenticationManager()

    func logout(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }

    func deleteAccount(completion: @escaping (Result<Void, Error>) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "User not authenticated"])))
            return
        }
        user.delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
