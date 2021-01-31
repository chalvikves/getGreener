//
//  friendsView.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2020-12-17.
//

import SwiftUI
import SwiftUICharts

struct FriendsView: View {
    @Environment(\.colorScheme) var colorScheme
    let colors = [Color.blue, Color.red, Color.purple, Color.green, Color.gray, Color.orange]
    let firstname = ["Viktor", "Erik", "Jesper", "Jonatan", "Tim", "Emanuel"]
    let lastname = ["Vestlund", "Hvidberg", "Fridensius", "Larsson", "Hudd", "Sandström"]
    
    
    var body: some View {
        
        VStack {
            
            Text("Get Greener")
                .foregroundColor(.green)
                .font(.title)
                
            
            ZStack{
//                Rectangle()
//                    .frame(height: 500)
//                    .cornerRadius(30)
//                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    
                VStack{
                    Text("Graf över CO2 utsläpp")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    BarChartView(data: ChartData(points: [1,5,2,3,6,1]), title: "Titel")
                        
                }
                
            }.padding()
            
            
            Spacer()
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    ForEach(0..<6){ i in
                        CircleAvatar(height: 50, width: 50, firstname: firstname[i], lastname: lastname[i], color: colors[i])
                    }
                }
            }.padding(.all, 20)
            
            Spacer()
        }
        
        
            
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
