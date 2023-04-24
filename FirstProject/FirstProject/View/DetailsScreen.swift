//
//  DetailsScreen.swift
//  FirstProject
//
//  Created by Hamzah Azam on 21/04/2023.
//

import SwiftUI

struct DetailsScreen: View {
    let email:String
    let password:String
    @EnvironmentObject var user: UserDetails
    var body: some View {
        Text("email - \(user.userEmail)")
        Text("password - \(user.userPassword)")

    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(email: "abc@abc.com", password: "12345678")
    }
}
