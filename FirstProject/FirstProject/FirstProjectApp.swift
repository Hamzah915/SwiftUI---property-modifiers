//
//  FirstProjectApp.swift
//  FirstProject
//
//  Created by Hamzah Azam on 21/04/2023.
//

import SwiftUI

@main
struct FirstProjectApp: App {
    @StateObject var userDetails = UserDetails()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(UserDetails()).onAppear(){
                userDetails.userEmail = "abc@abc.com"
                userDetails.userPassword = "1234567"
            }
        }
    }
}
