//
//  AuthView.swift
//  LunaLog
//
//  Created by Fajar Rashid on 7/16/24.
//

import SwiftUI
import Firebase

struct AuthView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isSignUp = false
    @State private var errorMessage = ""
    @State private var isUserLoggedIn = false
    
    var body: some View {
        ZStack {
            Color("Color3") 
                .edgesIgnoringSafeArea(.all)
            
            NavigationView {
                VStack(spacing: 20) {
                    Text(isSignUp ? "Create Account" : "Welcome Back")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color2"))
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
                        .padding(.horizontal, 20)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
                        .padding(.horizontal, 20)
                    
                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.horizontal, 20)
                    }
                    
                    Button(action: {
                        if isSignUp {
                            signUpUser()
                        } else {
                            loginUser()
                        }
                    }) {
                        Text(isSignUp ? "Sign Up" : "Login")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("Color3"))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 20)
                    
                    Button(action: {
                        isSignUp.toggle()
                    }) {
                        Text(isSignUp ? "Already have an account? Sign In" : "Don't have an account? Sign Up")
                            .foregroundColor(Color("Color3"))
                    }
                    .padding()
                }
                .padding()
                .navigationBarHidden(true)
                .fullScreenCover(isPresented: $isUserLoggedIn) {
                    OnboardingFlow()
                }
            }
        }
    }
    
    private func signUpUser() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = error.localizedDescription
                return
            }
            isUserLoggedIn = true
        }
    }
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = error.localizedDescription
                return
            }
            isUserLoggedIn = true
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
