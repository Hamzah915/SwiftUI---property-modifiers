//
//  ListScreen.swift
//  FirstProject
//
//  Created by Hamzah Azam on 21/04/2023.
//

import SwiftUI

struct ListScreen: View {
    let months = ["Jan", "Feb", "March","April","May"]
    let weeks = ["Mon", "Tue", "Wed","Thur","Fri"]
    let sections = ["First section","Second Section"]
    var body: some View {
        VStack{
            List{
                ForEach(sections, id: \.self){ part in
                    Section(part){
                        if part == "First section"{
                            ForEach(months, id: \.self){ month in
                                
                                NavigationLink{
                                    DetailsScreen(email: month, password: "password")
                                    
                                }label: {
                                    ListScreenCell(month: month)
                                }
                            }
                        }else{
                            ForEach(weeks, id: \.self){ week in
                                Text(week)
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    struct ListScreen_Previews: PreviewProvider {
        static var previews: some View {
            ListScreen()
        }
    }
    
}
