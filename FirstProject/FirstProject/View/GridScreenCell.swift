//
//  GridScreenCell.swift
//  FirstProject
//
//  Created by Hamzah Azam on 23/04/2023.
//

import SwiftUI

struct GridScreenCell: View {
    let cellData : String
    @EnvironmentObject var user: UserDetails
    var body: some View {
        VStack{
            Image(systemName: "balloon.fill").frame(maxWidth:20, maxHeight: 20)
        
            RoundedRectangle(cornerRadius: 10).fill(.green).frame(width: 100, height: 100).overlay(Text(cellData)).overlay(Text(user.userEmail))
        
        }
    }
}

struct GridScreenCell_Previews: PreviewProvider {
    static var previews: some View {
        GridScreenCell(cellData: "Grid Screen cell")
    }
}
