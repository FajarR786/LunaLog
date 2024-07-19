//
//  SleepLog.swift
//  LunaLog
//
//  Created by Fajar Rashid on 7/17/24.
//

import SwiftUI

struct SleepLog: View {
    var body: some View {
        Text("Sleep Log Page")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(Color("Color1"))
            .padding()
        NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
            Text("See progress here!!!")
                .padding()
                .background(Color("Color2"))
                .foregroundColor(.white)
                .cornerRadius(8)
            Spacer()
        }
            NavigationStack {
                ZStack {
                    VStack {
                        Text("Discover Better Sleep with LunaLog")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                            .frame(height: 90.0)
                        Text("Get useful tips and suggestions to improve your sleep. ") + Text("Proceed to choose a sleeping habit you most relate to:").fontWeight(.semibold)
                        
                        Spacer()
                            .frame(height: 30.0)
                        NavigationLink(destination: Early()) {
                            Text("You go to sleep around 9-10 PM and wake up around 5-6 AM")
                                .padding()
                                .background(Color("Color2"))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            Spacer()
                        }
                        NavigationLink(destination: Decent()) {
                            Text("You go to sleep around 10 PM-12:00 AM      and wake up around 6-8 AM                 ")
                                .padding()
                                .background(Color("Color2"))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            Spacer()
                        }
                        NavigationLink(destination: Late()) {
                            Text("You go to sleep around 12:00-3:00AM and wake up around 9-11 AM or later")
                                .padding()
                                .background(Color("Color2"))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        Spacer()
                            .frame(height: 90.0)
                    }
                    .padding()
                }
            }
            
        }
    }
    struct SleepLog_Previews: PreviewProvider {
        static var previews: some View {
            SleepLog()
        }
    }
    
