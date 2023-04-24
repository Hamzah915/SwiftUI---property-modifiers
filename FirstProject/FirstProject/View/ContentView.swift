//
//  ContentView.swift
//  FirstProject
//
//  Created by Hamzah Azam on 21/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var emailID:String = ""
    @State var password:String = ""
    @State var path = [Root]()
    let loginViewModel = LoginViewModel()
    @StateObject var userDetails = UserDetails()
    @Environment(\.colorScheme) var appColorMode
    @AppStorage("savedEmailID") var savedEmailID = ""
    var body: some View {
        NavigationStack(path: $path){
            VStack {
                TextField("EmailID", text:$emailID).textFieldStyle(.roundedBorder).padding(.bottom)
                
                SecureField("Password", text: $password).textFieldStyle(.roundedBorder).padding(.bottom)
                
                if appColorMode == .light{
                    Group{
                        Button("Sign In"){
                            if loginViewModel.doValidLogin(emailID: emailID, passwordID: password){
                                print(emailID)
                                print(password)
                                userDetails.userEmail = emailID
                                userDetails.userPassword = password
                                savedEmailID = emailID
                                path.append(.details)
                            }else{
                                print("Invalid login")
                            }
                        }
                        
                        Button("List Screen"){
                            savedEmailID = "AppStorage@gmail.com"
                            path.append(.list)
                            
                        }
                        Spacer()
                        Button("Grid Screen"){
                            path.append(.grid)
                        }
                        
                    }.frame(width:150).buttonStyle(.borderedProminent).foregroundColor(.white)
                }else if appColorMode == .dark{
                    
                    Button("Sign In"){
                        if loginViewModel.doValidLogin(emailID: emailID, passwordID: password){
                            print(emailID)
                            print(password)
                            userDetails.userEmail = emailID
                            userDetails.userPassword = password
                            path.append(.details)
                        }else{
                            print("Invalid login")
                        }
                    }
                    
                    Button("List Screen"){
                        path.append(.list)
                    }
                    Spacer()
                    Button("Grid Screen"){
                        path.append(.grid)
                    }
                    .frame(width:100).buttonStyle(.bordered).foregroundColor(.black)
                }
            }
        }
            .padding()
            .navigationDestination(for: Root.self){ navigate in
                switch navigate{
                case .details:
                    DetailsScreen(email: emailID, password: password).environmentObject(userDetails)
                case .list:
                    ListScreen().environmentObject(userDetails)
                case .grid:
                    GridScreen()
                default:
                    EmptyView()
                }
            }.navigationTitle(Text("Sign In"))
        }
    }
    enum Root{
        case list
        case details
        case grid
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
