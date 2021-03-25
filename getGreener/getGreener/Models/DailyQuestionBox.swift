//
//  DailyQuestionBox.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-03-22.
//

import SwiftUI

struct DailyQuestionBox: View {
    
    var title: String
    var image: String
    var color: Color
    var stageQuestion: Double
    var totalQuestion: Double
    var value: Int
    var unit: String
    
    
    var body: some View {
        //Divider()
        
        VStack(alignment: .leading, spacing: 30){
            HStack{
                Label {
                    Text(title)
                        .font(.title3)
                        .fontWeight(.semibold)
                } icon: {
                    Image(systemName: image)
                    
                }
                .foregroundColor(color)
                
                Spacer()
                
                VStack{
                    
                    Spacer().frame(height: 20)
                    
                    Text( "(\(Int(stageQuestion))/\(Int(totalQuestion)))" )
                        .font(.footnote)
                    .foregroundColor(.gray)
                    
                    Spacer().frame(height: 5)
                    
                    Image(systemName: "checkmark")
                        .foregroundColor(Color("Green")).opacity(stageQuestion == totalQuestion ? 1.0 : 0.0)
                        
                }
            }
            
            
            
            HStack{
                HealthValueView(value: "\(value)", unit: unit)
                    .foregroundColor(Color("MainText"))
                Spacer()
                Image(systemName: "chevron.right").foregroundColor(Color(.systemGray4)).imageScale(.small)
            }
            
            
        }.padding(.horizontal)
        
        
        ProgressView(value: stageQuestion, total: totalQuestion)
            .accentColor(color)
            .padding()
            //.padding(.bottom, -40)
        
        //Divider()
    }
}
