//
//  TransportationMethod.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-01-18.
//

import SwiftUI

struct TransportationMethod: View {
    
    var image: String
    var title: String
    @Binding var selected: Bool
    
    var body: some View {
        
        Button(action: {selected.toggle()}){
            HStack(spacing: 10){
                
                Image(systemName: image)
                
                Text(title)
                
                Spacer()
            }
        }
        .frame(height: 20)
        .foregroundColor(Color("MainText"))
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(selected ? Color("Green") : Color(.systemGray5), lineWidth: 2)
        )
        //.background(Color("Green"))
        //.cornerRadius(30)
        
//        VStack(spacing: 10){
//            Text(title)
//                .scaledToFill()
//                .minimumScaleFactor(0.5)
//                .lineLimit(1)
//            Image(systemName: image)
//        }
    }
    
}
