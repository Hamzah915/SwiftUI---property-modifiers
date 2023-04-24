//
//  ListScreenCell.swift
//  FirstProject
//
//  Created by Hamzah Azam on 21/04/2023.
//

import SwiftUI

struct ListScreenCell: View {
    let month:String
    var body: some View {
        VStack{
            Text("Holiday")
            HStack{
                Image(systemName: "house")
                Text(month)
            }
        }

    }
}

struct ListScreenCell_Previews: PreviewProvider {
    static var previews: some View {
        ListScreenCell(month: "Cell Title")
    }
}
