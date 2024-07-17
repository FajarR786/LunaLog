//
//  WelcomeScreen.swift
//  LunaLog
//
//  Created by Fajar Rashid on 7/16/24.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        ZStack {
            Color("Color4")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Text("Welcome to LunaLog")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Text("Your personalized sleep tracker and wellness companion")
                    .font(.headline)
                    .foregroundColor(Color("Color5"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Spacer()
                NavigationLink(destination: AuthView()) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("Color1"))
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}
