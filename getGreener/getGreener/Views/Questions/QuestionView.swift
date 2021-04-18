//
//  QuestionView.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2021-03-29.
//

import SwiftUI
import PageView

let theme = PageControlTheme(backgroundColor: Color("Main"), dotActiveColor: Color("SecondaryText"), dotInactiveColor: Color(.systemGray5), dotSize: 7.0, spacing: 9.0, padding: 4.0, xOffset: 12.0, yOffset: -12.0)

struct QuestionView: View {
    
    @StateObject var model = DailyQuestionsViewModel()
    
    var body: some View {
        VStack(alignment: .center){
            Text("Dagliga frågor")
                .font(.headline)
                .padding(.top, -70)
            
            //Spacer()
            
            HPageView(selectedPage: $model.pageIndex, theme: theme){
                SelectTransportView(model: model)
                FirstTransportView(model: model)
            }
            
            
            
        }
        
    }
    
}


