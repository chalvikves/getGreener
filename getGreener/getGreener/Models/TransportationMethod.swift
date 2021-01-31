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
    
    var body: some View {
        
        VStack(spacing: 10){
            Text(title)
                .scaledToFill()
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Image(systemName: image)
        }
    }
    
}
