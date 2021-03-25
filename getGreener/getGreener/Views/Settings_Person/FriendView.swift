//
//  FriendView.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-01-07.
//

import SwiftUI

let colors = [Color.blue, Color.red, Color.purple, Color.green, Color.gray, Color.orange]
let firstname = ["Viktor", "Erik", "Jesper", "Jonatan", "Tim", "Emanuel"]
let lastname = ["Vestlund", "Hvidberg", "Fridensius", "Larsson", "Hudd", "Sandström"]

struct FriendView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Vänner").font(.title).foregroundColor(.black).padding(.leading, 20)
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading, spacing: 15){
                    ForEach(0..<6){ i in
                        
                        Button(action: {}) {
                            HStack(spacing: 20){
                                CircleAvatar(height: 50, width: 50, firstname: firstname[i], lastname: lastname[i], color: colors[i])
                                Text("\(firstname[i]) \(lastname[i])")
                                Spacer()
                                Image(systemName: "chevron.right").padding(.trailing, 20)
                            }.padding(.top, i == 0 ? 10 : 0)
                        }
                        .foregroundColor(Color.black)
                        
                        
                        Divider()
                    }
                    
                }
            }
            .padding(.leading, 20)
            .background(Color("grey"))
            
        }
        .padding(.top, 20)
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView()
    }
}
