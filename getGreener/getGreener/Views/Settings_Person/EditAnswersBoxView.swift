//
//  EditAnswersBoxView.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-02-05.
//

import SwiftUI

struct EditAnswersBoxView: View {
    var image: String
    var text: String
    
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: image)
            Text(text)
            Spacer()
            //Image(systemName: "arrowshape.zigzag.right")
            Image(systemName: "chevron.right")
                
        }.padding()
    }
}
